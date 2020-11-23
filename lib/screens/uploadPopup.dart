import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'dart:io';
import 'package:sportswatch/screens/stopwatch.dart';
import 'package:sportswatch/widgets/buttons/default.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:path/path.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

Widget uploadPopup(int time, BuildContext context) {
  String _traniee = "";

  return AlertDialog(
    content: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        uploadPopup_stopwatchTime(time),
        uploadPopup_traineeDropdown(),
        uploadPopup_categoryDropdown(),
        uploadPopup_date(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AddButton(
              text: "Cancel",
              backgroundColor: SportsWatchColors.primary,
              onPressed: () => {Navigator.pop(context)},
            ),
            AddButton(
              text: "Upload",
              backgroundColor: SportsWatchColors.greenColor,
              onPressed: () => {},
            )
          ],
        )
      ],
    ),
  );
}

Widget uploadPopup_stopwatchTime(int time) {
  return Text(StopWatchTimer.getDisplayTime(time, hours: false, minute: false));
}

Widget uploadPopup_traineeDropdown() {
  return Text("2");
}

Widget uploadPopup_categoryDropdown() {
  List<DropdownMenuItem> items = [];
  List<String> names = ["10 høje", "obl", "fri"];
  var value;
  names.forEach(
    (element) {
      items.add(
        DropdownMenuItem(
          child: Text(element),
          value: element,
        ),
      );
    },
  );

  return Container(
    child: SearchableDropdown(
      items: items,
      hint: "select trainee",
      value: value,
      onChanged: (value) {},
    ),
  );
}

Widget uploadPopup_date() {
  return Text("4");
}
