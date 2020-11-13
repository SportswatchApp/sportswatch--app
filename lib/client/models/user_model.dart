import 'package:sportswatch/client/models/member_model.dart';

class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final DateTime dateJoined;
  final List<MemberModel> members;

  UserModel(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.dateJoined,
      this.members});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    List<MemberModel> memberList = List<MemberModel>();
    for (Map<String, dynamic> member in json['members']) {
      memberList.add(MemberModel.fromJson(member));
    }
    return UserModel(
        id: json['id'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        dateJoined: DateTime.parse(json['date_joined']),
        members: memberList);
  }

  String date() {
    return dateJoined.day.toString() +
        '-' +
        dateJoined.month.toString() +
        '-' +
        dateJoined.year.toString();
  }
}
