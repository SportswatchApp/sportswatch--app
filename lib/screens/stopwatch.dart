import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/buttons/default.dart';
import 'package:sportswatch/widgets/buttons/text_button.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/headings/h1.dart';
import 'package:sportswatch/widgets/input/password.dart';
import 'package:sportswatch/widgets/input/text.dart';
import 'package:sportswatch/widgets/layout/default.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopwatchScreen extends StatefulWidget {
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  String _startOrStop = "Start";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SportsWatchColors.backgroundColor,
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _stopwatch(context),
            _startStop(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _uploadTime(),
                _resetTime(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _stopwatch(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: StreamBuilder<int>(
        stream: _stopWatchTimer.rawTime,
        initialData: _stopWatchTimer.rawTime.value,
        builder: (context, snap) {
          final value = snap.data;
          final displayTime =
              StopWatchTimer.getDisplayTime(value, hours: false, minute: false);
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  displayTime,
                  style: const TextStyle(fontSize: 80),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _startStop() {
    return ButtonTheme(
      minWidth: 300,
      height: 300,
      child: RaisedButton(
        color: SportsWatchColors.primary,
        shape: CircleBorder(),
        child: Text(
          _startOrStop,
          style: TextStyle(fontSize: 40),
        ),
        onPressed: () async {
          if (_stopWatchTimer.isRunning) {
            _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
            setState(() {
              _startOrStop = "Start";
            });
          } else {
            _stopWatchTimer.onExecute.add(StopWatchExecute.start);
            setState(() {
              _startOrStop = "Stop";
            });
          }
        },
      ),
    );
  }

  Widget _resetTime() {
    return Padding(
      padding: EdgeInsets.all(2),
      child: RaisedButton(
        color: SportsWatchColors.primary,
        child: Text('reset'),
        onPressed: () async {
          _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
        },
      ),
    );
  }

  Widget _uploadTime() {
    return Padding(
      padding: EdgeInsets.all(2),
      child: RaisedButton(
        color: SportsWatchColors.greenColor,
        child: Text('Upload'),
        onPressed: () async {
          uploadBtnFunction();
        },
      ),
    );
  }

  void uploadBtnFunction() {
    print("Hello");
  }
}
