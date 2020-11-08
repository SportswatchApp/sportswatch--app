import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sportswatch/client/error.dart';
import 'package:sportswatch/client/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserApi {

  UserApi({Key key, this.baseUrl, this.headers});

  String baseUrl;
  Map<String, String> headers;

  Future<UserModel> post(
      String email,
      String firstName,
      String lastName,
      String password,
      String confPassword) async {
    final http.Response response = await http.post(
      this.baseUrl + 'users/',
      headers: this.headers,
      body: jsonEncode(<String, String>{
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'password': password,
        'conf_password': confPassword
      }),
    );

    Map<String, dynamic> json = jsonDecode(response.body);

    if (response.statusCode == 201) {
      return UserModel.fromJson(json);
    } else {
      throw ApiException(json["details"]);
    }

  }

  Future<bool> login(
      FlutterSecureStorage storage,
      String email,
      String password) async {
    final http.Response response = await http.post(
      this.baseUrl + 'login/',
      headers: this.headers,
      body: jsonEncode(<String, String> {
        'email': email,
        'password': password
      })
    );

    Map<String, dynamic> json = jsonDecode(response.body);
    if (response.statusCode == 202) {
      String token = json['token'];
      await storage.write(key: 'token', value: token);
      return true;
    } else {
      throw ApiException(json['detail']);
    }

  }

  Future<bool> logout(FlutterSecureStorage storage) async {
    await storage.delete(key: "token");
    return true;
  }

}
