class StoreModel {
  final String id;
  final String name;
  final String address;
  final String city;
  final String logo;
  final String pseudo;

  StoreModel(
      {required this.id,
      required this.name,
      required this.address,
      required this.city,
      required this.logo,
      required this.pseudo});

   factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      name: json['name'], 
      address: json['address'], 
      city: json['city'], 
      logo: json['logo'], 
      pseudo: json['pseudo']);
}
}
