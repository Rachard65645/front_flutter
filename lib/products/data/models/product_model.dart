
class ProductModel {
  final String id;
  final String name;
  final String brand;
  final double width;
  final int stock;
  final Store store;
  final String type;
  

  ProductModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.width,
    required this.stock,
    required this.store,
    required this.type
    });

  factory ProductModel.fromJom(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      width: json['width'].double,
      stock: json['stock'],
      store: Store.fromJsom(json['store']),
      type: json['type']
        
      );
  }
}








class Store {
  final String name;
  final String pseudo;
  final String city;
  final String address;

  Store(
      {required this.name,
      required this.pseudo,
      required this.city,
      required this.address});

  factory Store.fromJsom(Map<String, dynamic> json) {
    return Store(
      name: json['name'], 
      pseudo: json['pseudo'], 
      city: json['city'], 
      address: json['address']);
  }
}
