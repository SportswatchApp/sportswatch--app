import 'package:sportswatch/client/models/category.dart';
import 'package:sportswatch/client/models/trainee_model.dart';
import 'package:sportswatch/client/models/user_model.dart';

class Time {
  int id;
  Category category;
  int time;
  UserModel reportedBy;
  Trainee trainee;
  DateTime createdDate;

  Time(this.id,
      this.category,
      this.time,
      this.reportedBy,
      this.trainee,
      this.createdDate);

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      json['id'],
      Category.fromJson(json['category']),
      json['time'],
      UserModel.fromJson(json['reported_by']),
      Trainee.fromJson(json['trainee']),
      DateTime.parse(json['created_date'])
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "category_id": this.category.id,
      "trainee_id": this.trainee.id,
      "time": this.time
    };
  }

}
