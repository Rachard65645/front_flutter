import 'package:dio/dio.dart';

class StoreService {
  final Dio http;

  StoreService({required this.http});

  Future<dynamic> getStoreId({required String id}) async {
    Response response = await http.get('/store/$id');
    return response.data;
  }

  Future<dynamic> createStore({
    required String name,
    required String address,
    required String city,
    required String logo,
    required String pseudo,
    required String statusStore,
    required String aboutStore
  }) async {
    Response response = await http.post('/store/add', data: {
      'name': name,
      'address': address,
      'city': city,
      'logo': logo,
      'pseudo': pseudo,
      'statusStore': statusStore,
      'aboutStore': aboutStore,
    });
    return response.data;
  }
}
