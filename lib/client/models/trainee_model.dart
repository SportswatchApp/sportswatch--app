import 'package:sportswatch/client/models/member_model.dart';

class TraineeModel {
  final int id;
  MemberModel member;
  String fullName = "";

  TraineeModel({this.id, this.fullName, this.member});

  factory TraineeModel.fromJson(Map<String, dynamic> json) {
    MemberModel memberJson;
    if (json.containsKey('member')) {
      memberJson = MemberModel.fromJson(json['member']);
    }
    return TraineeModel(id: json['id'], member: memberJson);
  }

  String getFullName() {
    return member.user.firstName + " " + member.user.lastName;
  }
}
