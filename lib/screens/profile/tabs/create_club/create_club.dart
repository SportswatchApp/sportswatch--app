import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/buttons/text_button.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/layout/app_bar.dart';

import '_name.dart';

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
          text: textFields[index],
          onPressed: () => {},
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          Padding(padding: EdgeInsets.zero),
    );
  }

  List<Widget> _buildFormElements() {
    return <Widget>[_nameField(), _formSpace(5.0), _cityField()];
  }

  Widget _nameField() {
    return Container(
      height: 10,
      child: Text("Tobias"),
    );
  }

  Widget _cityField() {
    return Container(
      height: 10,
      child: Text("Tobias"),
    );
  }

  Widget _formSpace(double vertical) {
    return Container(
      height: 10,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: vertical),
      ),
    );
  }

  void _navigateAndDisplayNameField(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TypeClubNameScreen()),
    );

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}
