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
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.black,
        fontFamily: 'Quicksand',
      ),
      home: LoginScreen()
    );
  }
}
