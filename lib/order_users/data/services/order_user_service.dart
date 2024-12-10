import 'package:dio/dio.dart';

class OrderUserService {
  final Dio http;

  OrderUserService({required this.http});

  Future<dynamic> orderUser() async {
    Response response = await http.get('/orders/user');
    return response.data;
  }
}
