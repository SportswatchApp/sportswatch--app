import 'package:flutter/cupertino.dart';
import 'package:sportswatch/screens/graphs/graphs.dart';
import 'package:sportswatch/screens/profile/profile.dart';
import 'package:sportswatch/screens/stopwatch.dart';

class Routing {

  Map<String, WidgetBuilder> routes(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          StopwatchScreen(),
          GraphScreen(),
          ProfileScreen(),
        ].elementAt(index);
      },
    };
  }
}
