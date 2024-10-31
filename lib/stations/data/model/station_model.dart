class StationModel {
 final String id;
 final String name;
 final DateTime createdAt;
 final DateTime updatedAt;

  StationModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StationModel.fromJson(Map<String, dynamic> json) {
    return StationModel(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}