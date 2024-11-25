class StoresModel {
  final String id;
  final String name;
  final String logo;
  final String city;
  final List<Stock> stocks;
  final String pseudo;
  final Seller seller;
  final String statusStore;
  final String aboutStore;

  StoresModel(
      {required this.id,
      required this.name,
      required this.logo,
      required this.city,
      required this.stocks,
      required this.pseudo,
      required this.seller,
      required this.statusStore,
      required this.aboutStore});

  factory StoresModel.fromJson(Map<String, dynamic> json) {
    return StoresModel(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      city: json['city'],
      stocks: (json['Stocks'] as List).map((i) => Stock.fromJson(i)).toList(),
      pseudo: json['pseudo'],
      seller: Seller.fromJson(json['sellers']),
      statusStore: json['statusStore'],
      aboutStore: json['aboutStore'],
    );
  }
}

class Stock {
  final int quantity;
  final int price;
  final GasBottle gasBottle;

  Stock({
    required this.quantity,
    required this.price,
    required this.gasBottle,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      quantity: json['quantity'],
      price: json['price'],
      gasBottle: GasBottle.fromJson(json['gasBottles']),
    );
  }
}

class GasBottle {
  final String id;
  final String image;
  final GasStation gasStation;
  final BottleCategory bottleCategory;

  GasBottle({
    required this.id,
    required this.image,
    required this.gasStation,
    required this.bottleCategory,
  });

  factory GasBottle.fromJson(Map<String, dynamic> json) {
    return GasBottle(
      id: json['id'],
      image: json['image'],
      gasStation: GasStation.fromJson(json['gasStations']),
      bottleCategory: BottleCategory.fromJson(json['bottlesCategories']),
    );
  }
}

class GasStation {
  final String name;

  GasStation({required this.name});

  factory GasStation.fromJson(Map<String, dynamic> json) {
    return GasStation(
      name: json['name'],
    );
  }
}

class BottleCategory {
  final String brand;
  final String weight;

  BottleCategory({
    required this.brand,
    required this.weight,
  });

  factory BottleCategory.fromJson(Map<String, dynamic> json) {
    return BottleCategory(
      brand: json['brand'],
      weight: json['weigth'],
    );
  }
}

class Seller {
  final String status;
  final User user;

  Seller({
    required this.status,
    required this.user,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      status: json['status'],
      user: User.fromJson(json['users']),
    );
  }
}

class User {
  final String email;
  final String phone;

  User({
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      phone: json['phone'],
    );
  }
}
