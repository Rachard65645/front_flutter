class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String city;
  final String phone;
  

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.address,
    required this.city,
    required this.phone,
    required this.name,
  });

  factory UserModel.fromJsom(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      address: json['address'],
      city: json['city'],
      phone: json['phone'],
      
    );
  }
}
