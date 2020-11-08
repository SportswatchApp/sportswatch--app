import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/colors/default.dart';

class MainScaffold extends StatelessWidget {
  MainScaffold({this.body, this.onTap, this.selectedIndex});

  Widget body;
  final ValueChanged<int> onTap;
  int selectedIndex;


  @override
  Widget build(BuildContext context) {
    int _selectedIndex = this.selectedIndex;
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
            icon: Icon(Icons.timer),
            label: 'Timer',
            activeIcon: Icon(Icons.timer, size: 30)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Grafer',
            activeIcon: Icon(Icons.bar_chart)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
            activeIcon: Icon(Icons.account_circle)
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: SportsWatchColors.primary,
        onTap: this.onTap,
      ),
    );
  }
}
