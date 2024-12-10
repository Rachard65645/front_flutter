class OrderUserModel {
  final String status;
  final Store stores;
  final List<OrderItem> orderItems;

  OrderUserModel({
    required this.status,
    required this.stores,
    required this.orderItems,
  });

  factory OrderUserModel.fromJson(Map<String, dynamic> json) {
    return OrderUserModel(
      status: json['status'],
      stores: Store.fromJson(json['stores']),
      orderItems: (json['OrderItems'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'stores': stores.toJson(),
      'OrderItems': orderItems.map((item) => item.toJson()).toList(),
    };
  }
}

class Store {
  final String name;
  final String address;
  final String city;

  Store({
    required this.name,
    required this.address,
    required this.city
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      name: json['name'],
      address: json['address'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
    };
  }
}

class OrderItem {
  final GasBottle gasBottles;
  final int price;
  final int quantity;

  OrderItem({
    required this.gasBottles,
    required this.price,
    required this.quantity,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      gasBottles: GasBottle.fromJson(json['gasBottles']),
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gasBottles': gasBottles.toJson(),
      'price': price,
      'quantity': quantity,
    };
  }
}

class GasBottle {
  final GasStation gasStations;
  final BottleCategory bottlesCategories;

  GasBottle({
    required this.gasStations,
    required this.bottlesCategories,
  });

  factory GasBottle.fromJson(Map<String, dynamic> json) {
    return GasBottle(
      gasStations: GasStation.fromJson(json['gasStations']),
      bottlesCategories: BottleCategory.fromJson(json['bottlesCategories']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gasStations': gasStations.toJson(),
      'bottlesCategories': bottlesCategories.toJson(),
    };
  }
}

class GasStation {
  final String name;

  GasStation({
    required this.name,
  });

  factory GasStation.fromJson(Map<String, dynamic> json) {
    return GasStation(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}

class BottleCategory {
  final String weight;

  BottleCategory({
    required this.weight,
  });

  factory BottleCategory.fromJson(Map<String, dynamic> json) {
    return BottleCategory(
      weight: json['weigth'], // Note: JSON has "weigth", not "weight"
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weigth': weight,
    };
  }
}
