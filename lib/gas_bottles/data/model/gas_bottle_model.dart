class GasBottleModel {
  final String id;
  final String image;
  final GasStation gasStations;
  final BottleCategory bottlesCategories;

  GasBottleModel({
    required this.id,
    required this.image,
    required this.gasStations,
    required this.bottlesCategories,
  });

  factory GasBottleModel.fromJson(Map<String, dynamic> json) {
    return GasBottleModel(
      id: json['id'],
      image: json['image'],
      gasStations: GasStation.fromJson(json['gasStations']),
      bottlesCategories: BottleCategory.fromJson(json['bottlesCategories']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'gasStations': gasStations.toJson(),
      'bottlesCategories': bottlesCategories.toJson(),
    };
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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}


class BottleCategory {
  final String weight;

  BottleCategory({required this.weight});

  factory BottleCategory.fromJson(Map<String, dynamic> json) {
    return BottleCategory(
      weight: json['weigth'], 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weigth': weight,
    };
  }
}

