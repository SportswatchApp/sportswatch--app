import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/buttons/default.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/input/text.dart';
import 'package:sportswatch/widgets/layout/app_bar.dart';

class SingleTextFieldCallbackScreen extends StatelessWidget {
  SingleTextFieldCallbackScreen(this.title, this.initialValue);

  final String title;
  final String initialValue;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = this.initialValue == null ? "" : this.initialValue;
    return Scaffold(
        backgroundColor: SportsWatchColors.backgroundColor,
        appBar: CustomAppBar(this.title),
        body: _build(context)
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
        backgroundColor: SportsWatchColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_buildSingleForm(context)]),
          ),
        ),
    );
  }

  Widget _buildSingleForm(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextInputField(
            autoFocus: true,
            hintText: this.title,
            controller: controller,
            onEditingComplete: () => _callback(context),
          ),
          AddButton(
            text: "Gem",
            onPressed: () => _callback(context),
          ),
        ],
      ),
    );
  }

  void _callback(context) {
    Navigator.pop(context, controller.text);
  }

}
