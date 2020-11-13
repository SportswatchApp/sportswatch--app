import 'package:flutter/material.dart';
import 'package:sportswatch/client/api/api.dart';
import 'package:sportswatch/client/models/club_model.dart';
import 'package:sportswatch/screens/_callback_screens/single_text_field_screen.dart';
import 'package:sportswatch/widgets/alerts/snack_bar.dart';
import 'package:sportswatch/widgets/buttons/default.dart';
import 'package:sportswatch/widgets/buttons/text_button.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/layout/app_bar.dart';
import 'package:sportswatch/widgets/layout/scaffold.dart';
import 'package:sportswatch/widgets/loading/loadingScreen.dart';

class CreateClubScreen extends StatefulWidget {
  _CreateClubScreenState createState() => _CreateClubScreenState();
}

class _CreateClubScreenState extends State<CreateClubScreen> {
  final Api _api = Api();
  final List<String> textFields = <String>[
    'Indtast klubnavn',
    'Indtast postnummer',
    'Indtast by',
    'Indtast land',
    'Indtast region',
    '+ Opret klub'  // Last index should be the text of the create button!
  ];

  List<String> values = <String>['', '', '', '', ''];
  bool isLoading = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      appBar: CustomAppBar("Opret ny klub"),
      body: isLoading ? LoadingScreen() : _buildClubCreationForm(),
      selectedIndex: 2,
    );
  }

  Widget _buildClubCreationForm() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(10),
            itemCount: textFields.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == textFields.length - 1) {
                return _buildCreateClubButton();
              }
              return SimpleTextButton(
                text: values[index] != '' ? values[index] : textFields[index],
                onPressed: () => _navigateAndDisplayInputField(context, index),
                color:
                values[index] != '' ? Colors.white : SportsWatchColors
                    .fontColor,
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                Padding(padding: EdgeInsets.zero),
          ),
      ),
    );
  }

  Widget _buildCreateClubButton() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: AddButton(
        text: "+ Opret klub",
        onPressed: () => _createClub(),
      ),
    );
  }

  void _navigateAndDisplayInputField(BuildContext context, int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SingleTextFieldCallbackScreen(
                title: textFields[index], initialValue: values[index]),
      ),
    );

    setState(() {
      values[index] = result == null ? "" : result;
    });
  }

  void _createClub() {
    setState(() {
      isLoading = true;
    });
    _api.club.create(ClubModel(
        name: values[0],
        zipCode: values[1],
        city: values[2],
        country: values[3],
        region: values[4]
    )).listen((ClubModel club) {
      _onClubCreatedSuccess();
    }, onError: (_error) {
      _onErrorInCreatingClub(_error);
    });
  }

  void _onClubCreatedSuccess() {
    setState(() {
      isLoading = false;
    });
    Navigator.pop(context);
    showSnackBarSuccess(context, "Klubben blev oprettet");
  }

  void _onErrorInCreatingClub(_error) {
    setState(() {
      error = _error.detail;
      isLoading = false;
    });
    showSnackBarError(context, error);
  }

}
