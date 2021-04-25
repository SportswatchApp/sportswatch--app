import 'package:flutter/material.dart';
import 'package:sportswatch/client/api/api.dart';
import 'package:sportswatch/client/models/member_model.dart';
import 'package:sportswatch/client/models/user_model.dart';
import 'package:sportswatch/widgets/buttons/text_button.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/headings/h1.dart';
import 'package:sportswatch/widgets/loading/loadingScreen.dart';
import 'package:sportswatch/widgets/layout/default.dart';
import 'package:sportswatch/globals.dart' as globals;

import 'member_setup.dart';

class MemberSelectionScreen extends StatefulWidget {
  MemberSelectionScreen({Key? key}) : super(key: key);

  @override
  _MemberSelectionScreenState createState() => _MemberSelectionScreenState();
}

class _MemberSelectionScreenState extends State<MemberSelectionScreen> {
  List<MemberModel>? members;
  bool isLoading = false;
  Api _api = Api();
  String? error;

  @override
  void initState() {
    super.initState();
    loadMemberData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SportsWatchColors.backgroundColor,
      body: isLoading ? LoadingScreen() : _buildMemberSelection(),
    );
  }

  Widget _buildMemberSelection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemCount: members!.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _buildHeading();
            }
            return SimpleTextButton(
              members![index - 1].club.name,
              onPressed: () =>
                  _setGlobalMemberAndGoToFrontPage(context, members![index - 1]),
              color: SportsWatchColors.fontColor,
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              Padding(padding: EdgeInsets.zero),
        ),
      ),
    );
  }

  Widget _buildHeading() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(child: Heading1("Vælg klub")),
      ),
    );
  }

  void loadMemberData() {
    setState(() {
      isLoading = true;
    });
    _api.user!.get().listen((UserModel userModel) {
      if (userModel.members!.length == 0) {
        _goToSetupPage();
      } else if (userModel.members!.length == 1) {
        _setGlobalMemberAndGoToFrontPage(context, userModel.members!.first);
      } else {
        setState(() {
          members = userModel.members!;
          isLoading = false;
        });
      }
    }, onError: (_error) {
      setState(() {
        if (error != null) {
          error = _error.detail;
        }
        isLoading = false;
      });
    });
  }

  void _setGlobalMemberAndGoToFrontPage(
      BuildContext context, MemberModel member) {
    globals.memberId = member.id;
    globals.clubId = member.club.id;
    _toGoToFrontPage();
  }

  void _toGoToFrontPage() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainScaffoldController()),
        (route) => false);
  }

  void _goToSetupPage() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MemberSetupPage()),
        (route) => false);
  }
}
