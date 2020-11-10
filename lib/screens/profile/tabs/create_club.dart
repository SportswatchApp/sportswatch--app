import 'package:flutter/material.dart';
import 'package:sportswatch/screens/_callback_screens/single_text_field_screen.dart';
import 'package:sportswatch/widgets/buttons/text_button.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/layout/app_bar.dart';

class CreateClubScreen extends StatefulWidget {
  _CreateClubScreenState createState() => _CreateClubScreenState();
}

class _CreateClubScreenState extends State<CreateClubScreen> {
  final List<String> textFields = <String>[
    'Indtast klubnavn',
    'Indtast by',
    'Indtast postnummer',
    'Indtast land',
    'Indtast region'
  ];

  List<String> values = <String>['', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Opret ny klub"),
      backgroundColor: SportsWatchColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: _buildClubCreationForm(),
        ),
      ),
    );
  }

  Widget _buildClubCreationForm() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      itemCount: textFields.length,
      itemBuilder: (BuildContext context, int index) {
        return SimpleTextButton(
          text: values[index] != '' ? values[index] : textFields[index],
          onPressed: () => _navigateAndDisplayInputField(context, index),
          color: values[index] != '' ? Colors.white : SportsWatchColors.fontColor,
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          Padding(padding: EdgeInsets.zero),
    );
  }

  void _navigateAndDisplayInputField(BuildContext context, int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SingleTextFieldCallbackScreen(
            title: textFields[index],
            initialValue: values[index]
        ),
      ),
    );

    setState(() {
      values[index] = result == null ? "" : result;
    });
  }
}
