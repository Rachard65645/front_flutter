import 'package:dio/dio.dart';

class StoresService {
  final Dio http;

  StoresService({required this.http});

  Future<dynamic> getStores() async {
    Response response = await http.get('/store');
    return response.data;
  }
}
