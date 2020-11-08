import 'package:flutter/material.dart';
import 'package:sportswatch/client/api/user_api.dart';
import 'package:sportswatch/client/settings.dart';

class Api extends ApiSettings {

  Api({Key key}) {
    user = UserApi(
      baseUrl: this.baseUrl(),
      headers: this.headers()
    );
  }

  UserApi user;

}

var api = Api();
