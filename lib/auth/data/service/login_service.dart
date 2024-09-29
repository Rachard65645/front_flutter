import 'package:dio/dio.dart';

class LoginService {
  final Dio http;

  LoginService({required this.http});

  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    Response response = await http.post('/login', data: {
      "email": email,
      "password": password,
    });
    return response.data;
  }

  Future<dynamic> currentUser() async {
    Response response = await http.get(
      '/me',
    );
    return response.data;
  }
}
