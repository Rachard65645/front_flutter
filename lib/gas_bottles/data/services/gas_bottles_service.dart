import 'package:dio/dio.dart';

class GasBottlesService {
  final Dio http;

  GasBottlesService({required this.http});

  Future<dynamic> getGasBottle() async {
    Response response = await http.get('/bottles');
    return response.data;
  }
}
