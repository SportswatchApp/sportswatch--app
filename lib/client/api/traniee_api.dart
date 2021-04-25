import 'package:sportswatch/client/http/http.dart';
import 'package:flutter/material.dart';
import 'package:sportswatch/client/http/http.dart';
import 'package:sportswatch/client/models/club_model.dart';
import 'package:sportswatch/client/models/member_model.dart';
import 'package:sportswatch/client/models/trainee_model.dart';

class TranieeApi {
  HttpClient client;

  TranieeApi(this.client, {Key? key});

  Stream<List<TraineeModel>> getTranieeList() {
    return client.get("trainees/").map((Response response) {
      List<TraineeModel> traineeList = [];
      for (Map<String, dynamic> trainee in response.json["trainees"]) {
        traineeList.add(TraineeModel.fromJson(trainee));
      }
      return traineeList;
    });
  }
}
