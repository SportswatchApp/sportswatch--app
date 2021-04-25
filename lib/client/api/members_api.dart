import 'package:sportswatch/client/http/http.dart';
import 'package:flutter/material.dart';
import 'package:sportswatch/client/http/http.dart';
import 'package:sportswatch/client/models/club_model.dart';
import 'package:sportswatch/client/models/member_model.dart';

class MemberApi {
  HttpClient client;

  MemberApi(this.client, {Key? key});

  Stream<List<MemberModel>> getMemberList(int clubID) {
    return client.get("club/$clubID/members/").map((Response response) {
      List<MemberModel> memberList = [];
      for (Map<String, dynamic> member in response.json["members"]) {
        memberList.add(MemberModel.fromJson(member));
      }
      return memberList;
    });
  }
}
