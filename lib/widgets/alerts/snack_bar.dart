import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/colors/default.dart';

void showSnackBarError(BuildContext context, String error) {
  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          error,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: SportsWatchColors.errorColor,
        duration: Duration(seconds: 3),
      ),
    );
}

void showSnackBarSuccess(BuildContext context, String message) {
  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: SportsWatchColors.greenColor,
        duration: Duration(seconds: 3),
      ),
    );
}
