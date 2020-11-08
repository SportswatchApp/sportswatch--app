import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sportswatch/client/api/api.dart';
import 'package:sportswatch/screens/stopwatch.dart';
import 'package:sportswatch/widgets/buttons/default.dart';
import 'package:sportswatch/widgets/buttons/text_button.dart';
import 'package:sportswatch/widgets/colors/default.dart';
import 'package:sportswatch/widgets/input/password.dart';
import 'package:sportswatch/widgets/input/text.dart';
import 'package:sportswatch/widgets/loading/default.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final storage = new FlutterSecureStorage();
  bool _waiting = false;
  bool _loginSuccess = false;
  String _error = "";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: FutureBuilder(
              future: _getToken(),
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

  Future<String> _getToken() async {
    return await storage.read(key: "token");
  }

  void _login() {
    api.user.login(storage, emailController.text, passwordController.text).then(
        (loggedIn) {
      setState(() {
        _waiting = false;
        _error = "";
        _loginSuccess = true;
      });
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => pageAfterLoginSuccess()), (route) => false);
    }, onError: (error) {
      setState(() {
        _waiting = false;
        _error = error.toString();
        _loginSuccess = false;
      });
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
}
