import 'package:flutter/material.dart';
import 'package:sportswatch/client/models/member_model.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/layout/app_bar.dart';

class ProfileSettingsScreen extends StatefulWidget {
  MemberModel member;

  ProfileSettingsScreen(this.member);

  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Indstillinger"),
      backgroundColor: SportsWatchColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          children: [
            _buildLabel("Indstillinger"),
            _buildSimpleTile("Skift klub", widget.member.club.name, Icon(Icons.cached), () => {}),
            _buildLabel("Log ud"),
            ListTile(
              title: Text("Logud"),
              subtitle: Text("Klik her for at logge ud"),
              tileColor: SportsWatchColors.appBarColor,
              trailing: Icon(Icons.exit_to_app_rounded),
              onTap: () => {},
            ),
            _buildDivider(),
            ListTile(
              title: Text("Noget andet"),
              subtitle: Text("Something else"),
              tileColor: SportsWatchColors.appBarColor,
              trailing: Icon(Icons.exit_to_app_rounded),
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(color: SportsWatchColors.fontColor),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 3,
      color: SportsWatchColors.appBarColor,
    );
  }

  ListTile _buildSimpleTile(String title, String subtitle, Icon icon, onTab) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      tileColor: SportsWatchColors.appBarColor,
      trailing: icon,
      onTap: onTab,
    );
  }


}
