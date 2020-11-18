import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:sportswatch/client/api/api.dart';
import 'package:sportswatch/client/models/club_model.dart';
import 'package:sportswatch/widgets/alerts/default.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/headings/h1.dart';
import 'package:sportswatch/widgets/loading/loadingScreen.dart';

class MemberSetupPage extends StatefulWidget {
  MemberSetupPage({Key key}) : super(key: key);

  @override
  _MemberSetupPageState createState() => _MemberSetupPageState();
}

class _MemberSetupPageState extends State<MemberSetupPage> {
  List<ClubModel> clubs = [];
  bool isLoading = false;
  final Api _api = Api();

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
                child: Text('Du har følgende valgmuligheder'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: RaisedButton.icon(
                  padding: EdgeInsets.all(13),
                  onPressed: () => {},
                  icon: Icon(Icons.add_business),
                  label: Text("Opret ny forening"),
                  color: SportsWatchColors.primary,
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
    var value;
    clubs.forEach(
      (club) {
        items.add(
          DropdownMenuItem(
            child: Text(club.name),
            value: club,
          ),
        );
      },
    );

    return Container(
      child: SearchableDropdown(
        menuBackgroundColor: SportsWatchColors.backgroundColor,
        iconEnabledColor: SportsWatchColors.primary,
        items: items,
        hint: "Ansøg medlemsskab i klub",
        value: value,
        onChanged: (value) {
          showApplicationConfirmation(value);
        },
      ),
    );
  }

  void loadClubs() {
    setState(() {
      isLoading = true;
    });
    _api.club.list().listen((List<ClubModel> results) {
      setState(() {
        clubs = results;
        isLoading = false;
      });
    }, onError: (_error) {
      // TODO: Handle this error
      print(_error.detail);
    });
  }

  void showApplicationConfirmation(ClubModel club) {
    ConfirmationMessage(
        "Ansøg til " + club.name,
        "Vil du ansøge om medlemsskab hos " + club.name + "?",
        "Ansøg",
        () => runClubApplication(club)
    ).showAlertDialog(context);
  }

  void runClubApplication(ClubModel club) {
    Navigator.pop(context);
    setState(() {
      isLoading = true;
    });
    // TODO: Apply the request/application to the server
  }
}
