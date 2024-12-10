import 'package:gas/order_users/data/model/order_user_model.dart';
import 'package:gas/order_users/data/services/order_user_service.dart';

class OrderUserReposetories {
  final OrderUserService service;

  OrderUserReposetories({required this.service});

  Future<List<OrderUserModel>> orderUser() async {
    final data = await service.orderUser();
    return (data as List).map((json) => OrderUserModel.fromJson(json)).toList();
  }
}
