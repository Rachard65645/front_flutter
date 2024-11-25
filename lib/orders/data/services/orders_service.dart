import 'package:dio/dio.dart';

class OrdersService {
  final Dio http;

  OrdersService({required this.http});

  Future<dynamic> createCommande(
      {required String storeId,
      required String gasBottle_id,
      required num quantity,
      required String aggregator_method_id}) async {
    Response response = await http.post('/order/$storeId', data: {
      'storeId': storeId,
      'gasBottle_id': gasBottle_id,
      'quantity': quantity,
      'aggregator_method_id': aggregator_method_id
    });
    return response.data;
  }
}
