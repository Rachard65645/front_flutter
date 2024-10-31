import 'package:dio/dio.dart';

class StoreService {
  final Dio http;

  StoreService({required this.http});

  Future<dynamic> getStores() async {
    Response response = await http.get('/store');
    return response.data;
  }

  Future<dynamic> createStore({
    required String name,
    required String address,
    required String city,
    required String logo,
    required String pseudo,
  }) async {
    Response response = await http.post('/store/add', 
    data: {
      'name': name,
      'address': address,
      'city': city,
      'logo': logo,
      'pseudo': pseudo,
    }
    );
    return response.data;
  }
}
