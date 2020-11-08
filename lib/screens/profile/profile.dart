import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportswatch/screens/profile/tabs/tab.dart';
import 'package:sportswatch/widgets/buttons/default.dart';
import 'package:sportswatch/widgets/colors/default.dart';

class ProfileScreen extends StatefulWidget {
  _ProfileScreenState createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AddButton(
          text: "Hejsa",
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TestTabScreen()))
          },
        ),
      ),
      backgroundColor: SportsWatchColors.backgroundColor,
    );
  }
}