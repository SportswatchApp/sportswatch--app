class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final DateTime dateJoined;

  UserModel(
      {this.id, this.email, this.firstName, this.lastName, this.dateJoined});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        dateJoined: DateTime.parse(json['date_joined']));
  }

  String date() {
    return dateJoined.day.toString() + '-' +
        dateJoined.month.toString() + '-' +
        dateJoined.year.toString();
  }
}
