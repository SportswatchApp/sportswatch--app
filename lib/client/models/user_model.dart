import 'package:sportswatch/client/models/member_model.dart';

class UserModel {
  final int id;
  String email;
  String firstName;
  String lastName;
  DateTime dateJoined;
  List<MemberModel>? members;

  UserModel(
      this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.dateJoined,
      this.members);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    List<MemberModel> memberList = <MemberModel>[];
    for (Map<String, dynamic> member in json['members'] ?? []) {
      var m = MemberModel.fromJson(member);
      memberList.add(m);
    }
    return UserModel(
        json['id'],
        json['email'],
        json['first_name'],
        json['last_name'],
        json.containsKey("date_joined")
            ? DateTime.parse(json['date_joined'])
            : DateTime.now(),
        memberList);
  }

  String date() {
    return dateJoined.day.toString() +
        '-' +
        dateJoined.month.toString() +
        '-' +
        dateJoined.year.toString();
  }
}
