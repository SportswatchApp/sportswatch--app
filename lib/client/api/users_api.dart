import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sportswatch/client/error.dart';
import 'package:sportswatch/client/http/http.dart';
import 'package:sportswatch/client/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sportswatch/client/percist/percist_client.dart';

class UsersApi {

  UsersApi(this.client, {Key key});

  HttpClient client;

  Stream<bool> login(String email, String password) {
    return client.post('/login/', <String, String>{
      'email': email,
      'password': password
    }).map((Response response) {
      client.storage.set("token", response.json['token']);
      return response.success();
    });
  }

  Future<bool> logout(FlutterSecureStorage storage) async {
    await storage.delete(key: "token");
    return true;
  }

}
