import 'package:dio/dio.dart';

class StationService {
  final Dio http;

  StationService({required this.http});

  Future<dynamic> fetchStation({required String id}) async {
    Response response = await http.get('/station/$id');
    return response.data;
  }

  Future<dynamic> createStation({required String name}) async {
    Response response = await http.post('/station/add', data: {
      'name': name,
    });

    return response.data;
  }


  Future<dynamic> deleteStation({required String id}) async {
    Response response = await http.delete('/station/add');
    return response.data;
  }
  
  Future<dynamic> updateStation({
    required String id,
    required String name
  }) async {
    Response response = await http.put('/station/$id', data: {
      'name': name,
      'id': id
    });
    return response.data;
  }

}
