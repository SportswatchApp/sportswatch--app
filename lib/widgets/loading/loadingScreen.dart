import 'package:flutter/material.dart';

import 'default.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingCircle(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text('Vent venligst...'),
          ),
        ],
      ),
    );
  }
}
