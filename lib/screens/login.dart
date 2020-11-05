import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sportswatch/client/api/api.dart';
import 'package:sportswatch/widgets/buttons/default.dart';
import 'package:sportswatch/widgets/buttons/text_button.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/input/password.dart';
import 'package:sportswatch/widgets/input/text.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final storage = new FlutterSecureStorage();
  Future<bool> _loggedIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: SportsWatchColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_buildLoginForm(context)]),
          ),
        ));
  }

  Widget _buildLoginForm(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Image.asset(
                'static/images/sportswatchlogo.png',
                width: 60,
              ),
            ),
          ),
          TextInputField(
            hintText: 'Indtast e-mail',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
          ),
          PasswordInputField(
            hintText: 'Indtast adgangskode',
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: AddButton(
                  text: 'Login',
                  onPressed: () {
                    setState(() {
                      _loggedIn = login();
                    });
                  },
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: FutureBuilder(
              future: getToken(),
              initialData: 'Token: ',
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("token: ${snapshot.data}");
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: SportsWatchColors.primary,
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Center(
              child: SimpleTextButton(
                onPressed: () => {},
                text: 'Glemt adgangskode?',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Center(
              child: SimpleTextButton(
                onPressed: () => _launchURL(),
                text: 'Opret ny bruger',
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<String> getToken() async {
    return await storage.read(key: "token");
  }

  Future<bool> login() async {
    return await api.user.login(storage, 'tt@dd.com', 'qwerty');
  }

  _launchURL() async {
    const url = 'https://sportswatchapp.dk/signup/';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}
