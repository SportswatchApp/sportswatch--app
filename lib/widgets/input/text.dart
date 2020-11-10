import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/colors/default.dart';

class TextInputField extends StatelessWidget {
  TextInputField(
      {Key key,
      this.hintText,
      this.controller,
      this.keyboardType,
      this.onTap,
      this.autoFocus,
      this.onEditingComplete});

  final String hintText;
  TextEditingController controller;
  TextInputType keyboardType;
  GestureTapCallback onTap;
  bool autoFocus;
  VoidCallback onEditingComplete;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: this.keyboardType,
        controller: this.controller,
        cursorColor: SportsWatchColors.primary,
        onTap: this.onTap,
        onEditingComplete: onEditingComplete,
        autofocus: this.autoFocus == null ? false : this.autoFocus,
        decoration: InputDecoration(
          filled: true,
          fillColor: SportsWatchColors.normalGrey,
          hintText: this.hintText,
          border: _buildBorder(),
          focusedBorder: _buildBorder(),
          enabledBorder: _buildBorder(),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ));
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(6.0),
        ),
        borderSide: BorderSide(color: SportsWatchColors.lightGrey, width: 1));
  }
}
