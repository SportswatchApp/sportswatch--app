import 'package:sportswatch/client/models/member_model.dart';

class TraineeModel {
  final int id;
  MemberModel member;
  String fullName = "";

  TraineeModel({this.id, this.fullName, this.member});

  factory TraineeModel.fromJson(Map<String, dynamic> json) {
    return TraineeModel(
        id: json['id'], member: MemberModel.fromJson(json['member']));
  }

  String getFullName() {
    return member.user.firstName + " " + member.user.lastName;
  }
}
