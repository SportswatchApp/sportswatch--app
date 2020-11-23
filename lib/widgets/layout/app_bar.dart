import 'package:flutter/material.dart';
import 'package:sportswatch/widgets/colors/default.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final Widget leading;
  final Widget second;

  CustomAppBar(this.title, {Key key, Widget leading, Widget second})
      : preferredSize = Size.fromHeight(50.0),
        second = second,
        leading = leading,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppBar(
          centerTitle: true,
          title: Text(this.title),
          backgroundColor: SportsWatchColors.appBarColor,
          elevation: 3,
          actions: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: second
            ),
          ],
          leading: this.leading),
    );
  }
}

Widget popContextLeading(BuildContext context) {
  return IconButton(
      icon: Icon(Icons.keyboard_arrow_left),
      onPressed: () => Navigator.pop(context));
}
