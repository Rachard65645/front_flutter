import 'package:gas/orders/data/services/orders_service.dart';
import 'package:gas/payment/data/model/payment_model.dart';

class OrdersReposetory {
  final OrdersService service;

  OrdersReposetory({required this.service});

  Future<PaymentModel> createCommande(
      {required String storeId,
      required String gasBottle_id,
      required num quantity,
      required String aggregator_method_id}) async {
    final data = await service.createCommande(
        storeId: storeId,
        gasBottle_id: gasBottle_id,
        quantity: quantity,
        aggregator_method_id: aggregator_method_id);

    return PaymentModel.fromJson(data);
  }
}
