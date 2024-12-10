import 'package:dio/dio.dart';

class PositionService {
  final Dio http;

  PositionService({required this.http});


  Future<dynamic> getPosition() async {
    Response response = await http.get('/position');
    return response.data;
  }
}
