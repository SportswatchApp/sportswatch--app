import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/colors/default.dart';

class GraphScreen extends StatefulWidget {
  _GraphScreenState createState() => _GraphScreenState();
}


class _GraphScreenState extends State<GraphScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is the graph screen'),
      backgroundColor: SportsWatchColors.backgroundColor,
    );
  }
}