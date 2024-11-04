import 'package:dio/dio.dart';

class BottleCategoriesService {
  final Dio http;

  BottleCategoriesService({required this.http});

  Future<dynamic> getBottleCategories() async {
    Response response = await http.get('/bottleCategories');
    return response.data;
  }
}
