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

class ProfileScreen extends StatefulWidget {
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Api _api = Api();
  UserModel user;
  MemberModel member;
  String error;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        "Profil",
        second: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => _pushSettingsTab(),
        ),
      ),
      body: RefreshIndicator(
        child: buildProfile(),
        onRefresh: () async {
          loadUserData();
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
          buildProfileInformation(),
          Divider(),
          buildClubInformation()
        ],
      );
    }
  }

  Widget buildProfileInformation() {
    return displayProfileInformation(user);
  }

  Widget displayProfileInformation(UserModel user) {
    return Container(
      child: Card(
        child: InkWell(
          splashColor: SportsWatchColors.primary,
          onTap: () => _pushTestTabScreen(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 5.00, horizontal: 20),
                  leading: Icon(Icons.account_circle, size: 35),
                  title: Text(user.firstName + ' ' + user.lastName),
                  subtitle: Text(user.email)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildClubInformation() {
    return Container(
      child: Card(
        child: InkWell(
          splashColor: SportsWatchColors.primary,
          onTap: () => {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 5.00, horizontal: 20),
                  leading: Icon(Icons.emoji_events, size: 35),
                  title: Text(member.club.name),
                  subtitle: Text(member.club.name)),
              SimpleTextButton(
                onPressed: _pushCreateClubScreen,
                text: "+ Opret ny klub",
              )
            ],
          ),
        ),
      ),
    );
    /*return ;*/
  }

  void loadUserData() {
    setState(() {
      isLoading = true;
    });
    _api.user.get().listen((UserModel userModel) {
      setState(() {
        user = userModel;
        member = currentMember(user);
        isLoading = false;
      });
    }, onError: (_error) {
      setState(() {
        error = _error.detail;
        isLoading = false;
      });
    });
  }

  void _pushTestTabScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TestTabScreen()));
  }

  void _pushCreateClubScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CreateClubScreen()));
  }

  void _pushSettingsTab() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProfileSettingsScreen(member)));
  }
}
