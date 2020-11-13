import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/layout/app_bar.dart';
import 'package:sportswatch/widgets/layout/scaffold.dart';

class GraphScreen extends StatefulWidget {
  _GraphScreenState createState() => _GraphScreenState();
}


class _GraphScreenState extends State<GraphScreen> {

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      appBar: CustomAppBar("Grafer"),
      body: Text('This is the graph screen'),
      selectedIndex: 1,
    );
  }
}