class SearchModel {
  final String id;
  final String name;
  final String address;
  final String city;
  final String logo;
  final String pseudo;
  final String statusStore;
  final String aboutStore;
 

  SearchModel({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.logo,
    required this.pseudo,
    required this.statusStore,
    required this.aboutStore,
    
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
   
    return SearchModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      city: json['city'],
      logo: json['logo'],
      pseudo: json['pseudo'],
      statusStore: json['statusStore'],
      aboutStore: json['aboutStore'],
    );
  }
}


