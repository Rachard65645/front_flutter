import 'package:dio/dio.dart';

class BottleCategoryService {
  final Dio http;

  BottleCategoryService({required this.http});

  Future<dynamic> fetchBottleCategory({required String id}) async {
    Response response = await http.get('/bottleCategory/$id');
    return response.data;
  }

  Future<dynamic> createBottleCategory({
    required String brand,
    required num weigth
    
    }) async {
    Response response = await http.post('/bottleCategory/add');
    return response.data;
  }

  Future<dynamic> pathBottleCategory({
    required String id,
    required String brand,
    required num weigth
    
    }) async {
    Response response = await http.put('/bottleCategory/update/$id');
    return response.data;
  }

  Future<dynamic> deleteBottleCategory({required String id}) async {
    Response response = await http.delete('/bottleCategory/delele/$id');
    return response.data;
  }
}
