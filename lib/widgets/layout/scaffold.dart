import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/colors/default.dart';

class MainScaffold extends StatelessWidget {

  int selectedIndex;
  final Widget body;
  final PreferredSizeWidget appBar;

  MainScaffold({Key key, this.body, this.appBar, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.appBar,
      body: this.body,
      backgroundColor: SportsWatchColors.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: 'Timer',
              activeIcon: Icon(Icons.timer, size: 30)),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Grafer',
              activeIcon: Icon(Icons.bar_chart, size: 30)),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
            activeIcon: Icon(Icons.account_circle, size: 30),
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: SportsWatchColors.primary,
        onTap: (int index) => _changeScreen(context, index),
      ),
    );
  }

  void _changeScreen(BuildContext context, int index) {
    if (index == 0) {
      Navigator.of(context).pushNamedAndRemoveUntil('/timer', (route) => false);
    } else if (index == 1) {
      Navigator.of(context).pushReplacementNamed('/graphs');
    } else {
      Navigator.of(context).pushReplacementNamed('/profile');
    }
  }
}
