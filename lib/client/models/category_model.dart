import 'package:sportswatch/client/models/club_model.dart';

class CategoryModel {
  int id;
  String name;
  ClubModel club;

  CategoryModel({this.id, this.name, this.club});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    CategoryModel category = CategoryModel(id: json['id'], name: json['name']);
    if (json.containsKey("club")) {
      category.club = ClubModel.fromJson(json["club"]);
    }
    return category;
  }
}
