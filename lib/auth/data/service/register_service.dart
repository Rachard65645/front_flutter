import 'package:dio/dio.dart';

class RegisterService {
  final Dio http;

  RegisterService({required this.http});

  Future<dynamic> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    Response response = await http.post(
      '/register',
      data: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
      },
    );
    return response.data;
  }
}
