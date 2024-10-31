import 'package:dio/dio.dart';

class StationsService {
  final Dio http;

  StationsService({required this.http});

  Future<dynamic> getStations() async {
    Response response = await http.get('/stations');
    return response.data;
  }
}
