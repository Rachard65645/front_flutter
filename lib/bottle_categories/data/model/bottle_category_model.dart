class BottleCategoryModel {
 final String id;
 final String brand;
 final String weight;
  final DateTime updatedAt;

  BottleCategoryModel({
    required this.id,
    required this.brand,
    required this.weight,
    required this.updatedAt,
  });


  factory BottleCategoryModel.fromJson(Map<String, dynamic> json) {
    return BottleCategoryModel(
      id: json['id'] as String,
      brand: json['brand'] as String,
      weight: json['weigth'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand,
      'weigth': weight,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
