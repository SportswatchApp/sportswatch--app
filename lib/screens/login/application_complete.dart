import 'package:flutter/material.dart';
import 'package:sportswatch/client/api/api.dart';
import 'package:sportswatch/client/models/member_model.dart';
import 'package:sportswatch/client/models/user_model.dart';
import 'package:sportswatch/globals.dart';
import 'package:sportswatch/screens/profile/tabs/create_club.dart';
import 'package:sportswatch/screens/profile/tabs/profile_settings.dart';
import 'package:sportswatch/screens/profile/tabs/tab.dart';
import 'package:sportswatch/widgets/buttons/text_button.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/layout/app_bar.dart';
import 'package:sportswatch/widgets/loading/loadingScreen.dart';

class ApplicationDoneScreen extends StatefulWidget {
  _ApplicationDoneScreenState createState() => _ApplicationDoneScreenState();
}

class _ApplicationDoneScreenState extends State<ApplicationDoneScreen> {
  Api _api = Api();
  UserModel user;
  MemberModel member;
  String error;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadApplicationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        "Ansøgninger",
        second: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => {}
        ),
      ),
      body: RefreshIndicator(
        child: buildProfile(),
        onRefresh: () async {
          loadApplicationData();
          return;
        },
      ),
      backgroundColor: SportsWatchColors.backgroundColor,
    );
  }

  Widget buildProfile() {
    if (isLoading) {
      return LoadingScreen();
    } else {
      return ListView(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        children: [
        ],
      );
    }
  }

  void loadApplicationData() {
    setState(() {
      isLoading = true;
    });
    setState(() {
      isLoading = false;
    });
  }
}
