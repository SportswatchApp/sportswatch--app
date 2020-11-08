import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/colors/default.dart';

class MainScaffold extends StatelessWidget {
  MainScaffold({this.body, this.onTap});

  Widget body;
  final ValueChanged<int> onTap;


  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Center(
          child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tobias")
              ],
            ),
            backgroundColor: SportsWatchColors.appBarColor,
            elevation: 3,
          ),
        ),
      ),
      backgroundColor: SportsWatchColors.backgroundColor,
      body: this.body,
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
        onTap: this.onTap,
      ),
    );
  }
}
