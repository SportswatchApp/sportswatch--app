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
      this.id,
      this.club,
      this.dateJoined,
      this.isTrainee,
      this.isCoach,
      this.isAdmin,
      this.active,
      this.user);

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
        json['id'],
        ClubModel.fromJson(json['club']),
        DateTime.parse(json['date_joined']),
        json['is_trainee'],
        json['is_admin'],
        json['is_coach'],
        json['active'],
        UserModel(json['user']['id'], "a", "a", "a", DateTime.now(), <MemberModel>[])
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': this.id,
      'club': this.club.toJson(),
      'date_joined': this.dateJoined.toString(),
    };
  }

}
