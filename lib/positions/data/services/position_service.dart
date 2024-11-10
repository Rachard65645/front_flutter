import 'package:dio/dio.dart';

class PositionService {
  final Dio http;

  PositionService({required this.http});


  Future<dynamic> getPosition() async {
    Response response = await http.get('https://ipinfo.io?token=064b094342bce7');
    return response.data;
  }
}
