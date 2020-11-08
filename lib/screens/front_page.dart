import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sportswatch/widgets/colors/default.dart';

class FrontPageScreen extends StatefulWidget {
  FrontPageScreen({Key key}) : super(key: key);

  @override
  _FrontPageScreenState createState() => _FrontPageScreenState();
}

class _FrontPageScreenState extends State<FrontPageScreen> {
  final storage = new FlutterSecureStorage();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: SportsWatchColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_buildLoginForm(context)]),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer, size: 40),
              label: 'Timer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: SportsWatchColors.primary,
          onTap: _onItemTapped,
        ));
  }

  Widget _buildLoginForm(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Image.asset(
                'static/images/sportswatchlogo.png',
                width: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
