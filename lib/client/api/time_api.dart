import 'package:flutter/material.dart';
import 'package:sportswatch/client/http/http.dart';
import 'package:sportswatch/client/models/time_model.dart';

class TimeApi {
  TimeApi(this.client, {Key? key});

  HttpClient client;

  Stream<TimeModel> create(TimeModel time) {
    return client
        .post('/', time.toJson())
        .map((Response response) => TimeModel.fromJson(response.json));
  }
}
