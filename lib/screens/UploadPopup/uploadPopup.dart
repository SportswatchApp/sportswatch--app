import 'package:flutter/material.dart';
import 'package:sportswatch/client/api/api.dart';
import 'package:sportswatch/client/models/category_model.dart';
import 'package:sportswatch/client/models/club_model.dart';
import 'package:sportswatch/client/models/member_model.dart';
import 'package:sportswatch/client/models/time_model.dart';
import 'package:sportswatch/client/models/trainee_model.dart';
import 'package:sportswatch/client/models/user_model.dart';
import 'dart:io';
import 'package:sportswatch/screens/Stopwatch/stopwatch.dart';
import 'package:sportswatch/screens/UploadPopup/popupResponseMessage.dart';
import 'package:sportswatch/widgets/buttons/default.dart';
import 'package:sportswatch/widgets/buttons/text_button.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:path/path.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:sportswatch/globals.dart' as globals;

class UploadDialog extends StatefulWidget {
  UploadDialog(this.time);

  int time = 0;

  @override
  State<StatefulWidget> createState() => _UploadDialogState(time);
}

class _UploadDialogState extends State<UploadDialog> {
  _UploadDialogState(int time) {
    this._time = time;
  }

  final Api _api = Api();
  PopupReturnMessage returnMessage = PopupReturnMessage(false, "");
  TimeModel? _timeObject;
  List<TraineeModel> traniees = [];
  List<CategoryModel> categories = [];
  int _time = 0;
  TraineeModel? _trainee;
  CategoryModel _category = CategoryModel(1, "");
  DateTime _selectedDate = DateTime.now();

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
          uploadPopup_stopwatchTime(_time),
          uploadPopup_Dropdown_trainee(traniees),
          uploadPopup_Dropdown_category(categories),
          uploadPopup_date(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AddButton(
                text: "Cancel",
                backgroundColor: SportsWatchColors.primary,
                onPressed: () => {
                  returnMessage.success = false,
                  returnMessage.message = "You pressed cancel",
                  Navigator.pop(context, returnMessage)
                },
              ),
              AddButton(
                text: "Upload",
                backgroundColor: SportsWatchColors.greenColor,
                onPressed: () => {
                  makeTimeObject(),
                  uploadTime(_timeObject!),
                  Navigator.pop(context, returnMessage)
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget uploadPopup_stopwatchTime(int time) {
    return Text(
        StopWatchTimer.getDisplayTime(time, hours: false, minute: false));
  }

  Widget uploadPopup_Dropdown_trainee(List<TraineeModel> itemsList) {
    TraineeModel value;

    return Container(
      child: DropdownSearch<TraineeModel>(
        hint: "Select a Trainee",
        showSearchBox: true,
        mode: Mode.MENU,
        showSelectedItem: true,
        items: itemsList,
        itemAsString: (TraineeModel t) => t.getFullName(),
        label: "Menu mode",
        showClearButton: true,
        onChanged: (TraineeModel trainee) => print(trainee.getFullName()),
      ),
    );
  }

  Widget uploadPopup_Dropdown_category(List<CategoryModel> itemsList) {
    List<DropdownMenuItem> items = [];
    CategoryModel value;
    itemsList.forEach(
      (category) {
        items.add(
          DropdownMenuItem(
            child: Text(category.name),
            value: category,
          ),
        );
      },
    );

    return Container(
      child: DropdownSearch<String>(
        hint: "Select a country",
        mode: Mode.MENU,
        showSelectedItem: true,
        items: ["Brazil", "Italia", "Tunisia", 'Canada'],
        label: "Menu mode",
        showClearButton: true,
        onChanged: (String? chosen) => print(chosen!),
      ),
    );
  }

  Widget uploadPopup_date() {
    return SimpleTextButton(
      _selectedDate.toLocal().toString().split(' ')[0],
      onPressed: () async => {dateSelector(this.context)},
      color: SportsWatchColors.fontColor,
    );
  }

  Future<Null> dateSelector(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010, 1),
        lastDate: DateTime(2100)))!;

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void loadClubData() {
    _api.trainee!.getTranieeList().listen((List<TraineeModel> result) {
      setState(() {
        traniees = result;
      });
    });
  }

  void uploadTime(TimeModel timeObject) {
    _api.time!.create(timeObject).listen((TimeModel timeModel) {
      returnMessage.success = true;
      returnMessage.message = "Upload successfull";
      print(timeModel.toJson());
    }, onError: (_error) {
      print(_error.toString());
    });
  }

  void makeTimeObject() {
    setState(() {
      _timeObject =
          TimeModel(0, _category, _time, null, _trainee!, _selectedDate);
    });
  }

  void loadTraineesCategories(TraineeModel trainee) {
    List<CategoryModel> someResult = [];
    someResult.add(CategoryModel(1, "10 høje"));
    someResult.add(CategoryModel(2, "Obel"));
    someResult.add(CategoryModel(3, "Fri"));

    setState(() {
      categories = someResult;
    });
  }
}
