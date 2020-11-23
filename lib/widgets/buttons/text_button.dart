import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/colors/default.dart';

class SimpleTextButton extends StatelessWidget {
  SimpleTextButton({Key key, this.onPressed, this.text, this.color});

  final VoidCallback onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        this.text,
        style: new TextStyle(
            fontSize: 15.0,
            color:
                this.color == null ? SportsWatchColors.fontColor : this.color),
      ),
    );
  }
}
