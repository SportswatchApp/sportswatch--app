import 'package:flutter/material.dart';
import 'package:sportswatch/client/http/http.dart';
import 'package:sportswatch/client/models/user_model.dart';

class UserApi {
  UserApi(this.client, {Key? key});

  HttpClient client;

  Stream<UserModel> get() {
    return client
        .get('/')
        .map((Response response) => UserModel.fromJson(response.json));
  }
}
