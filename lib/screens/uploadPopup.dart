import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'dart:io';
import 'package:sportswatch/screens/stopwatch.dart';

Widget uploadPopup(int time) {
  String _traniee = "";

  return AlertDialog(
    content: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        uploadPopup_stopwatchTime(time),
        uploadPopup_traineeDropdown(),
        uploadPopup_categoryDropdown(),
        uploadPopup_date()
      ],
    ),
  );
}

Widget uploadPopup_stopwatchTime(int time) {
  return Text(time.toString());
}

Widget uploadPopup_traineeDropdown() {
  return Text("2");
}

Widget uploadPopup_categoryDropdown() {
  List<DropdownMenuItem> items = [];
  List<String> names = ["tobias dybdahl", "marcus egge", "some dude"];
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
