import 'package:flutter/material.dart';
import 'package:sportswatch/screens/login/login.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue,
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.white,
        fontFamily: 'Quicksand',
      ),
      home: LoginScreen()
    );
  }
}
