import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';
import 'package:sportswatch/client/api/api.dart';
import 'package:sportswatch/client/models/club_model.dart';
import 'package:sportswatch/client/models/member_model.dart';
import 'package:sportswatch/screens/login/application_complete.dart';
import 'package:sportswatch/widgets/alerts/default.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/headings/h1.dart';
import 'package:sportswatch/widgets/loading/loadingScreen.dart';

class MemberSetupPage extends StatefulWidget {
  MemberSetupPage({Key? key}) : super(key: key);

  @override
  _MemberSetupPageState createState() => _MemberSetupPageState();
}

class _MemberSetupPageState extends State<MemberSetupPage> {
  List<ClubModel> clubs = [];
  bool isLoading = false;
  final Api _api = Api();
  String error = "";
  var selectedClub;

  @override
  void initState() {
    super.initState();
    loadClubs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SportsWatchColors.backgroundColor,
      body: isLoading ? LoadingScreen() : buildSetupPage(),
    );
  }

  Widget buildSetupPage() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Heading1("Velkommen"),
              Heading1("til SportsWatch"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: makeText('Du har følgende valgmuligheder'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton.icon(
                  onPressed: () => {},
                  icon: Icon(Icons.add_business, color: Colors.white),
                  label: whiteText("Opret ny forening"),
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
                ),
              ),
              Text('eller'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: searchClubsPopup(),
              ),
            ]),
      ),
    );
  }

  Widget searchClubsPopup() {
    List<DropdownMenuItem> items = [];
    clubs.forEach(
          (club) {
        items.add(
          DropdownMenuItem(
            child: SizedBox(
              child: Text(club.name,
                  style: TextStyle(
                    fontSize: 18,
                  )),
            ),
            value: club,
          ),
        );
      },
    );

    return Container(
      child: SearchChoices.single(
        items: items,
        value: selectedClub,
        hint: "Vælg klub",
        searchHint: Text("Vælg klub",
            style: TextStyle(color: SportsWatchColors.lighterFontColor)),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: SportsWatchColors.primary,
        ),
        onChanged: (value) {
          selectedClub = value;
          showApplicationConfirmation();
        },
        searchInputDecoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 24,
            color: SportsWatchColors.fontColor,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12),
        ),
        isExpanded: true,
        displayClearIcon: false,
        style: TextStyle(
          fontSize: 18,
          color: SportsWatchColors.fontColor,
        ),
        closeButton: 'Fortryd',
        menuBackgroundColor: SportsWatchColors.backgroundColor,
        iconEnabledColor: SportsWatchColors.primary,
        searchFn: (String keyword, items) {
          List<int> ret = <int>[];
          if (keyword != null && items != null && keyword.isNotEmpty) {
            keyword.split(" ").forEach((k) {
              int i = 0;
              items.forEach((item) {
                if (k.isNotEmpty &&
                    (item.value.name
                        .toString()
                        .toLowerCase()
                        .contains(k.toLowerCase()))) {
                  ret.add(i);
                }
                i++;
              });
            });
          }
          if (keyword.isEmpty) {
            ret = Iterable<int>.generate(items.length).toList();
          }
          return (ret);
        },
      ),
    );

    /*SearchableDropdown(
          menuBackgroundColor: SportsWatchColors.backgroundColor,
          iconEnabledColor: SportsWatchColors.primary,
          items: items,
          hint: "Ansøg medlemsskab i klub",
          value: value,
          onChanged: (value) {
            showApplicationConfirmation(value);
          },
          closeButton: "Fortryd",
          searchFn: (String keyword, items) {
            List<int> ret = <int>[];
            if (keyword != null && items != null && keyword.isNotEmpty) {
              keyword.split(" ").forEach((k) {
                int i = 0;
                items.forEach((item) {
                  if (k.isNotEmpty &&
                      (item.value.name
                          .toString()
                          .toLowerCase()
                          .contains(k.toLowerCase()))) {
                    ret.add(i);
                  }
                  i++;
                });
              });
            }
            if (keyword.isEmpty) {
              ret = Iterable<int>.generate(items.length).toList();
            }
            return (ret);
          }),
    );*/
  }

  void loadClubs() {
    setState(() {
      isLoading = true;
    });
    _api.club!.list().listen((List<ClubModel> results) {
      setState(() {
        clubs = results;
        isLoading = false;
      });
    }, onError: (_error) {
      // TODO: Handle this error
      print(_error.detail);
    });
  }

  void showApplicationConfirmation() {
    if (selectedClub != null) {
      ConfirmationMessage(
          "Ansøg til " + selectedClub.name,
          "Vil du ansøge om medlemsskab hos " + selectedClub.name + "?",
          "Ansøg",
              () => runClubApplication(selectedClub),
          onCancel: () => selectedClub = null,
      ).showAlertDialog(context);
    }
  }

  void runClubApplication(ClubModel club) {
    Navigator.pop(context);
    setState(() {
      isLoading = true;
    });
    _api.club!.apply(club.id).listen((MemberModel member) {
      setState(() {
        isLoading = false;
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ApplicationDoneScreen()));
      });
    }, onError: (_error) {
      setState(() {
        error = _error.detail;
        isLoading = false;
      });
    });
  }

  Text makeText(String msg, {Color? c}) {
    return Text(
      msg,
      style: TextStyle(
          color: c == null ? SportsWatchColors.fontColor : c, fontSize: 18),
    );
  }

  Text whiteText(String msg) {
    return makeText(msg, c: Colors.white);
  }
}
