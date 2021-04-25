import 'package:flutter/material.dart';
import 'package:sportswatch/client/http/http.dart';
import 'package:sportswatch/client/models/club_model.dart';
import 'package:sportswatch/client/models/member_model.dart';

class ClubApi {
  ClubApi(this.client, {Key? key});

  HttpClient client;

  Stream<ClubModel> create(ClubModel clubModel) {
    return client
        .post('/club/', clubModel.toJson())
        .map((Response response) => ClubModel.fromJson(response.json));
  }

  Stream<List<ClubModel>> list() {
    return client.get('/clubs/').map((Response response) {
      List<ClubModel> clubs = [];
      for (Map<String, dynamic> club in response.json['clubs']) {
        clubs.add(ClubModel.fromJson(club));
      }
      return clubs;
    });
  }

  Stream<MemberModel> apply(int clubId) {
    return client
        .post('/club/' + clubId.toString() + '/apply/')
        .map((Response response) => MemberModel.fromJson(response.json));
  }
}
