import 'package:dio/dio.dart';

class SearchStoresService {
  final Dio http;

  SearchStoresService({required this.http});

  Future<dynamic> searchStore({
    required String name,
    required String address,
  }) async {
    Response response = await http
        .get('/stores?name=$name&address=$address', 
        data: {
          'name': name,
          'address': address,
        }
        );
    return response.data;
  }
}
