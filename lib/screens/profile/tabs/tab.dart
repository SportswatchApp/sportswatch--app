import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/buttons/default.dart';
import 'package:sportswatch/widgets/colors/default.dart';

class TestTabScreen extends StatefulWidget {
  _TestTabScreenState createState() => _TestTabScreenState();
}


class _TestTabScreenState extends State<TestTabScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Here we gooo!!!"),
      backgroundColor: SportsWatchColors.backgroundColor,
    );
  }
}
