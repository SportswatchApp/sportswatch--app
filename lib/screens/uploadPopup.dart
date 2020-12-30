import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:sportswatch/client/api/api.dart';
import 'package:sportswatch/client/models/category_model.dart';
import 'package:sportswatch/client/models/member_model.dart';
import 'package:sportswatch/client/models/trainee_model.dart';
import 'dart:io';
import 'package:sportswatch/screens/stopwatch.dart';
import 'package:sportswatch/widgets/buttons/default.dart';
import 'package:sportswatch/widgets/buttons/text_button.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:path/path.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:sportswatch/globals.dart' as globals;

class UploadDialog extends StatefulWidget {
  UploadDialog(this.time);

  int time;
  @override
  State<StatefulWidget> createState() => _UploadDialogState(time);
}

class _UploadDialogState extends State<UploadDialog> {
  _UploadDialogState(int time) {
    this.time = time;
  }

  final Api _api = Api();
  List<TraineeModel> traniees = [];
  List<CategoryModel> categories;
  int time = 0;
  String _traniee = "hej", _category = " med dig";
  List<String> calltest = [""];
  DateTime _selectedDate = DateTime.now();
  List<String> dummyNames = ["tobias", "Marcus", "Peter"];
  List<String> dummyCategories = ["10 høje", "obl", "fri"];

  @override
  void initState() {
    super.initState();
    loadClubData();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          uploadPopup_stopwatchTime(time),
          uploadPopup_Dropdown(traniees, "Select traniee", 1),
          //uploadPopup_Dropdown(dummyCategories, "Select category", 2),
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

  Widget uploadPopup_Dropdown(
      List<TraineeModel> itemsList, String hint, int type) {
    List<DropdownMenuItem> items = [];
    var value;
    itemsList.forEach(
      (trainee) {
        items.add(
          DropdownMenuItem(
            child: Text(trainee.getFullName()),
            value: trainee.id,
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

  void loadClubData() {
    _api.trainee.getTranieeList().listen((List<TraineeModel> result) {
      setState(() {
        traniees = result;
      });
    });
  }
}
