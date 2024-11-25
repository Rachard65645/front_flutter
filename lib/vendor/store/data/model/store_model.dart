class StoreModel {
  final String id;
  final String name;
  final String address;
  final String city;
  final String logo;
  final String aboutStore;
  final String statusStore;
  final String pseudo;

  StoreModel({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.logo,
    required this.aboutStore,
    required this.statusStore,
    required this.pseudo,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      city: json['city'],
      logo: json['logo'],
      aboutStore: json['aboutStore'],
      statusStore: json['statusStore'],
      pseudo: json['pseudo']
    );
  }
}
