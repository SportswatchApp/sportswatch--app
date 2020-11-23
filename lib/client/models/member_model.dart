import 'package:sportswatch/client/models/club_model.dart';
import 'package:sportswatch/client/models/user_model.dart';

class MemberModel {
  final int id;
  final ClubModel club;
  final DateTime dateJoined;
  final UserModel user;
  final bool isTrainee;
  final bool isCoach;
  final bool isAdmin;
  final bool active;

  MemberModel(
      {this.id,
      this.club,
      this.dateJoined,
      this.user,
      this.isTrainee,
      this.isCoach,
      this.isAdmin,
      this.active});

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
        id: json['id'],
        club: ClubModel.fromJson(json['club']),
        dateJoined: DateTime.parse(json['date_joined']),
        isTrainee: json['is_trainee'],
        isAdmin: json['isAdmin'],
        isCoach: json['isCoach'],
        user: UserModel(id: json['user']['id']));
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': this.id,
      'club': this.club.toJson(),
      'date_joined': this.dateJoined.toString(),
    };
  }

}
