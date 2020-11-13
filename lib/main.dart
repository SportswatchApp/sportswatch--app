import 'package:flutter/material.dart';
import 'package:sportswatch/screens/graphs/graphs.dart';
import 'package:sportswatch/screens/login.dart';
import 'package:sportswatch/screens/profile/profile.dart';
import 'package:sportswatch/screens/stopwatch.dart';

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
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen(),
              settings: settings,
            );
          case '/timer':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => StopwatchScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return child;
              },
            );
          case '/graphs':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => GraphScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return child;
              },
            );
          case '/profile':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => ProfileScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return child;
              },
            );
          default:
            throw new Exception('No such route');
        }
      },
    );
  }
}
