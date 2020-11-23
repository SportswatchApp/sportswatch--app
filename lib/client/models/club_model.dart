class ClubModel {
  final int id;
  final String name;
  final String city;
  final String zipCode;
  final String country;
  final String region;

  ClubModel({
    this.id,
    this.name,
    this.city,
    this.zipCode,
    this.country,
    this.region});

  factory ClubModel.fromJson(Map<String, dynamic> json) {
    return ClubModel(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      zipCode: json['zip_code'],
      country: json['country'],
      region: json['region']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'city': this.city,
      'zip_code': this.zipCode,
      'country': this.country,
      'region': this.region
    };
  }
}
