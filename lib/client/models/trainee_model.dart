import 'package:sportswatch/client/models/member_model.dart';

class TraineeModel {
  final int id;
  MemberModel? member;
  String fullName = "";

  TraineeModel(this.id, this.member);

  factory TraineeModel.fromJson(Map<String, dynamic> json) {
    MemberModel? memberJson = null;
    if (json.containsKey('member')) {
      memberJson = MemberModel.fromJson(json['member']);
    }
    return TraineeModel(
        json['id'],
        memberJson
    );
  }

  String getFullName() {
    return member!.user.firstName + " " + member!.user.lastName;
  }
}
