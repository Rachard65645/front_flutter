import 'package:dio/dio.dart';

class ProductService {
  final Dio http;

  ProductService({required this.http});

  Future<dynamic> fetchProduct() async {
    Response response = await http.get('/products/get');
    return response.data;
  }
}
