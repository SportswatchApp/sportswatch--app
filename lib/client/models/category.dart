import 'package:sportswatch/client/models/club_model.dart';

class Category {
  int id;
  String name;
  ClubModel? club;

  Category(this.id, this.name, {this.club});

  factory Category.fromJson(Map<String, dynamic> json) {
    Category category = Category(
      json['id'],
      json['name']
    );
    if (json.containsKey("club")) {
      category.club = ClubModel.fromJson(json["club"]);
    }
    return category;
  }

}