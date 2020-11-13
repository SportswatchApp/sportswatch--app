import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/layout/app_bar.dart';
import 'package:sportswatch/widgets/loading/loadingScreen.dart';

class ProfileSettingsScreen extends StatefulWidget {
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("Indstillinger"),
        backgroundColor: SportsWatchColors.backgroundColor,
        body: SettingsList(
          backgroundColor: SportsWatchColors.backgroundColor,
          darkBackgroundColor: SportsWatchColors.backgroundColor,
          sections: [
            SettingsSection(
              title: 'Section',
              tiles: [
                SettingsTile(
                  title: 'Language',
                  leading: Icon(Icons.language),
                  onTap: () {},
                ),
                SettingsTile.switchTile(
                  title: 'Use fingerprint',
                  leading: Icon(Icons.fingerprint),
                  switchValue: true,
                  onToggle: (bool value) {},
                ),
              ],
            ),
          ],
        )
    );
  }

}
