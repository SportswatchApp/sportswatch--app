import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/colors/default.dart';

class AddButton extends StatelessWidget {
  AddButton({Key key, this.onPressed, this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: onPressed,
        color: SportsWatchColors.primary,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: BorderSide(color: SportsWatchColors.primary)),
        child: Text(this.text, style: new TextStyle(fontSize: 15.0)));
  }
}
