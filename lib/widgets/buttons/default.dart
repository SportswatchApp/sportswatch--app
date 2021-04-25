import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/colors/default.dart';

class AddButton extends StatelessWidget {
  AddButton({this.text, this.onPressed, this.backgroundColor, Key? key});

  VoidCallback? onPressed;
  String? text;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: onPressed,
        color: backgroundColor == null
            ? SportsWatchColors.primary
            : backgroundColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: BorderSide(color: SportsWatchColors.primary)),
        child: Text(this.text!, style: new TextStyle(fontSize: 15.0)));
  }
}
