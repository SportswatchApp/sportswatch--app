import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sportswatch/client/api/api.dart';
import 'package:sportswatch/screens/stopwatch.dart';
import 'package:sportswatch/widgets/alerts/default.dart';
import 'package:sportswatch/widgets/buttons/default.dart';
import 'package:sportswatch/widgets/buttons/text_button.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/input/password.dart';
import 'package:sportswatch/widgets/input/text.dart';
import 'package:sportswatch/widgets/loading/default.dart';
import 'package:sportswatch/widgets/layout/default.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _waiting = false;
  bool _loginSuccess = false;
  String _error = "";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Api _api = Api();

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
          Center(
            child: Image.asset(
              'static/images/sportswatchlogo.png',
              width: 60,
            ),
          ),
          _loadOrShowError(),
          TextInputField(
            hintText: 'Indtast e-mail',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
          ),
          PasswordInputField(
            hintText: 'Indtast adgangskode',
            controller: passwordController,
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
                    _waiting = true;
                  });
                  _login();
                },
              ),
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
                onPressed: () => _launchSignupWebsite(),
                text: 'Opret ny bruger',
              ),
            ),
          )
        ],
      ),
    );
  }

  StatefulWidget pageAfterLoginSuccess() {
    return StopwatchScreen();
  }

  void _login() {
    _api.users.login(emailController.text, passwordController.text).listen((event) {
      setState(() {
        _waiting = false;
        _error = "";
        _loginSuccess = true;
      });
      Navigator.of(context).pushReplacementNamed('/timer');
    }, onError: (error) {
      if (error is SocketException) {
        setState(() {
          _waiting = false;
          _loginSuccess = false;
        });
        connectionErrorAlert().showAlertDialog(context);
      } else {
        setState(() {
          _waiting = false;
          _error = error.detail;
          _loginSuccess = false;
        });
      }
    });
  }

  Widget _loadOrShowError() {
    if (_waiting) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: LoadingCircle()
        ),
      );
    } else if (_error.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
            child: Text(_error)
        ),
      );
    } else {
      return Padding(padding: EdgeInsets.symmetric(vertical: 0), child: Text(''));
    }
  }

  _launchSignupWebsite() async {
    const url = 'https://sportswatchapp.dk/signup/';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  AlertMessage connectionErrorAlert() {
    return AlertMessage(
        "Kunne ikke oprette forbindelse",
        "Det var ikke muligt at oprette forbindelse til serveren. Prøv igen senere"
    );
  }

}
