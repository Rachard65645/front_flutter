
class SellerModel {
  final String id;
  final String cni;
  final String rccm;
  final String patente;
  final String cc;
  final String? status;
  final User users;

  SellerModel({
    required this.id,
    required this.cni,
    required this.rccm,
    required this.patente,
    required this.cc,
    this.status,
    required this.users
  });

  factory SellerModel.fromJson(Map<String, dynamic> json) {
    return SellerModel(
      id: json['id'] ,
      cni: json['CNI'] ,
      rccm: json['RCCM'] ,
      patente: json['Patente'],
      cc: json['CC'],
      status: json['status'],
      users: User.fromJson(json['users']),
    );
  }
}

class User {
  final String name;

  User({required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
    );
  }
}
