import 'package:flutter/material.dart';
import 'package:sportswatch/client/http/http.dart';
import 'package:sportswatch/client/models/club_model.dart';

class ClubApi {
  ClubApi(this.client, {Key key});

  HttpClient client;

  Stream<ClubModel> create(ClubModel clubModel) {
    return client
        .post('/club/', clubModel.toJson())
        .map((Response response) => ClubModel.fromJson(response.json));
  }
}
