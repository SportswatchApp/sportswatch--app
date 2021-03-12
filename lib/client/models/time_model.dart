import 'package:sportswatch/client/models/category_model.dart';
import 'package:sportswatch/client/models/trainee_model.dart';
import 'package:sportswatch/client/models/user_model.dart';

class TimeModel {
  int id;
  CategoryModel category;
  TraineeModel trainee;
  int time;
  UserModel reportedBy;
  DateTime createdDate;

  TimeModel(
      {this.id,
      this.category,
      this.time,
      this.reportedBy,
      this.createdDate,
      this.trainee});

  factory TimeModel.fromJson(Map<String, dynamic> json) {
    return TimeModel(
        id: json['id'],
        category: CategoryModel.fromJson(json['category']),
        trainee: TraineeModel.fromJson(json['trainee']),
        time: json['time'],
        reportedBy: UserModel.fromJson(json['reported_by']),
        createdDate: DateTime.parse(json['created_date']));
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "category_id": this.category.id,
      "trainee_id": this.trainee.id,
      "time": this.time
    };
  }
}
