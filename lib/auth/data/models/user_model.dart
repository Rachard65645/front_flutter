class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? address;
  final String? city;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
      'city': city,
      
    };
  }
}
