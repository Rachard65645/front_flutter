import 'package:dio/dio.dart';

class RegisterService {
  final Dio http;

  RegisterService({required this.http});

  Future<dynamic> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String city,
    required String address,
  }) async {
    Response response = await http.post(
      '/register',
      data: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "city": city,
        "address": address,
      },
    );
    return response.data;
  }
}
