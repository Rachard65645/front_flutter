import 'package:dio/dio.dart';

class StoreUserService {
  final Dio http;

  StoreUserService({required this.http});

  Future<dynamic> my_store() async {
    Response response = await http.get(
      '/my_store',
    );

    return response.data;
  }
}
