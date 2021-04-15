class ClubModel {
  final int id;
  final String name;
  final String? city;
  final String? zipCode;
  final String? country;
  final String? region;

  ClubModel(
    this.id,
    this.name,
    this.city,
    this.zipCode,
    this.country,
    this.region);

  factory ClubModel.fromJson(Map<String, dynamic> json) {
    return ClubModel(
      json['id'],
      json['name'],
      json['city'] ?? null,
      json['zip_code'] ?? null,
      json['country'] ?? null,
      json['region'] ?? null
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
