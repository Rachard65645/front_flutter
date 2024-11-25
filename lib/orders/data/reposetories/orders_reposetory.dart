import 'package:gas/orders/data/model/orders_model.dart';
import 'package:gas/orders/data/services/orders_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersReposetory {
  final OrdersService service;

  OrdersReposetory({required this.service});

  Future<void> createCommande(
      {required String storeId,
      required String gasBottle_id,
      required num quantity,
      required String aggregator_method_id}) async {
    // feature now
    final data = await service.createCommande(
        storeId: storeId,
        gasBottle_id: gasBottle_id,
        quantity: quantity,
        aggregator_method_id: aggregator_method_id);

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final url = await preferences.setString('payment_url', data['payment_url']);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.get('payment_url'));
    
  }
}
