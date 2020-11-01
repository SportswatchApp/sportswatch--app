class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;

  UserModel({this.id, this.email, this.firstName, this.lastName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name']
    );
  }

}