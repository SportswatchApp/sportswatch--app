import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'dart:io';
import 'package:sportswatch/screens/stopwatch.dart';
import 'package:sportswatch/widgets/buttons/default.dart';
import 'package:sportswatch/widgets/buttons/text_button.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:path/path.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class uploadDialog extends StatefulWidget {
  uploadDialog(int time) {
    this.time = time;
  }

  int time;
  @override
  State<StatefulWidget> createState() => _uploadDialogState(time);
}

class _uploadDialogState extends State<uploadDialog> {
  _uploadDialogState(int time) {
    this.time = time;
  }

  int time = 0;
  String _traniee = "hej", _category = " med dig";
  List<String> calltest = [""];
  DateTime _selectedDate = DateTime.now();
  List<String> dummyNames = ["tobias", "Marcus", "Peter"];
  List<String> dummyCategories = ["10 høje", "obl", "fri"];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          uploadPopup_stopwatchTime(time),
          uploadPopup_Dropdown(dummyNames, "Select traniee", 1),
          uploadPopup_Dropdown(dummyCategories, "Select category", 2),
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
                onPressed: () => {
                  print(time.toString() +
                      " " +
                      _traniee +
                      " " +
                      _category +
                      " " +
                      _selectedDate.toString().split(" ")[0])
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget uploadPopup_stopwatchTime(int time) {
    return Text(
        StopWatchTimer.getDisplayTime(time, hours: false, minute: false));
  }

  Widget uploadPopup_Dropdown(List<String> itemsList, String hint, int type) {
    List<DropdownMenuItem> items = [];
    var value;
    itemsList.forEach(
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
        hint: hint,
        value: value,
        onChanged: (value) {
          setState(() {
            if (type == 1) {
              _traniee = value;
            } else if (type == 2) {
              _category = value;
            }
          });
        },
      ),
    );
  }

  Widget uploadPopup_date() {
    return SimpleTextButton(
      onPressed: () async => {dateSelector(this.context)},
      text: _selectedDate.toLocal().toString().split(' ')[0],
      color: Colors.white,
    );

    //return Text(date.toLocal().toString().split(' ')[0]);
  }

  Future<Null> dateSelector(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010, 1),
        lastDate: DateTime(2100));

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}
