class Trainee {
  final int id;

  Trainee(this.id);

  factory Trainee.fromJson(Map<String, dynamic> json) {
    return Trainee(json['id']);
  }

}