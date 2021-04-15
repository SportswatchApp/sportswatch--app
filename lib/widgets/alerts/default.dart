import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/buttons/default.dart';
import 'package:sportswatch/widgets/colors/default.dart';

class AlertMessage {
  AlertMessage(this.title, this.message);

  String title;
  String message;

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(this.title),
      content: Text(this.message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class ConfirmationMessage {
  ConfirmationMessage(this.title, this.message, this.okText, this.onOk,
      {this.onCancel});

  String title;
  String message;
  String okText;
  VoidCallback onOk;
  VoidCallback? onCancel;

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Annullér"),
      onPressed: () {
        if (onCancel != null) {
          onCancel!.call();
        }
        Navigator.pop(context);
      },
    );
    Widget continueButton = AddButton(text: okText, onPressed: this.onOk);
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: SportsWatchColors.backgroundColor,
      title: Text(this.title),
      content: Text(this.message),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
