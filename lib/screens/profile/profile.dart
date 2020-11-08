import 'package:flutter/material.dart';
import 'package:sportswatch/client/api/api.dart';
import 'package:sportswatch/client/models/user_model.dart';
import 'package:sportswatch/screens/profile/tabs/tab.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/layout/app_bar.dart';
import 'package:sportswatch/widgets/loading/default.dart';

class ProfileScreen extends StatefulWidget {
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Api _api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Profil"),
      body: buildProfile(),
      backgroundColor: SportsWatchColors.backgroundColor,
    );
  }

  Widget buildProfile() {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      children: [buildProfileInformation()],
    );
  }

  Widget buildProfileInformation() {
    return StreamBuilder<UserModel>(
      stream: _api.user.get(),
      builder: (BuildContext context, AsyncSnapshot<UserModel> model) {
        if (model.hasData) {
          return displayProfileInformation(model.data);
        } else {
          return LoadingCircle();
        }
      },
    );
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

  void _pushTestTabScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TestTabScreen()));
  }
}
