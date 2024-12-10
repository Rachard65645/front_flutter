class StoreUserModel {
  final String id;
  final String name;
  final String logo;
  final String address;
  final String city;

  StoreUserModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.address,
    required this.city,
  });

  factory StoreUserModel.fromJson(Map<String, dynamic> json) {
    return StoreUserModel(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      address: json['address'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'address': address,
      'city': city,
    };
  }
}
