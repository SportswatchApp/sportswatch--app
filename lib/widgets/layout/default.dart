import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/layout/routing.dart';

class MainScaffoldController extends StatefulWidget {
  @override
  _MainScaffoldControllerState createState() => _MainScaffoldControllerState();
}

class _MainScaffoldControllerState extends State<MainScaffoldController> {
  int _selectedIndex = 0;
  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState!.maybePop();
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: SportsWatchColors.backgroundColor,
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: SportsWatchColors.appBarColor,
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
            currentIndex: _selectedIndex,
            selectedItemColor: SportsWatchColors.primary,
            onTap: (int index) => setState(() => _selectedIndex = index)),
      ),
    );
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = Routing().routes(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
