import 'package:dio/dio.dart';

class SellersService {
  final Dio http;

  SellersService({required this.http});

  Future<dynamic> getSeller() async {
    final response = await http.get('/seller');
    return response.data;
  }
}
