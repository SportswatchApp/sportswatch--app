import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Heading1 extends StatelessWidget {
  Heading1(this.text, {Key? key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 20
      ),
    );
  }
}
