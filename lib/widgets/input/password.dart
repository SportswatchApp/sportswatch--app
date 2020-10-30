import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/colors/default.dart';

class PasswordInputField extends StatelessWidget {
  PasswordInputField({Key key, this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enableSuggestions: false,
        autocorrect: false,
        obscureText: true,
        cursorColor: SportsWatchColors.primary,
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
        borderSide: BorderSide(color: SportsWatchColors.lightGrey, width: 1)
    );
  }
}
