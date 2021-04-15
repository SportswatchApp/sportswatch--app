import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/colors/default.dart';

class Heading1 extends StatelessWidget {
  Heading1(this.text, {Key? key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
        color: SportsWatchColors.fontColor,
        fontSize: 30
      ),
    );
  }
}
