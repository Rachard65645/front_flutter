import 'package:dio/dio.dart';

class FilterProductService {
  final Dio http;
  String path = '/products';

  FilterProductService({required this.http});

  Future<dynamic> fetchProducts() async {
    Response response = await http.get(path);
    return response.data;
  }
}
