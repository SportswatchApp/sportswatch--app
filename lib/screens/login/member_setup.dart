import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/headings/h1.dart';

class MemberSetupPage extends StatefulWidget {
  MemberSetupPage({Key key}) : super(key: key);

  @override
  _MemberSetupPageState createState() => _MemberSetupPageState();
}

class _MemberSetupPageState extends State<MemberSetupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SportsWatchColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Heading1("Velkommen"),
                Heading1("til SportsWatch"),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text('Du har følgende valgmuligheder'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: RaisedButton.icon(
                    padding: EdgeInsets.all(13),
                    onPressed: () => {},
                    icon: Icon(Icons.add_business),
                    label: Text("Opret ny forening"),
                    color: SportsWatchColors.primary,
                  ),
                ),
                Text('eller'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: RaisedButton.icon(
                    padding: EdgeInsets.all(13),
                    onPressed: () => {},
                    icon: Icon(Icons.search),
                    label: Text("Ansøg medlemsskab"),
                    color: SportsWatchColors.primary,
                  ),
                ),
              ]),
        ),
      ),
    );
  }

}
