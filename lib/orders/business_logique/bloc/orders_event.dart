part of 'orders_bloc.dart';

@immutable
sealed class OrdersEvent {}

final class CreateOrderEvent extends OrdersEvent {
  final String storeId;
  final String gasBottle_id;
  final num quantity;
  final String aggregator_method_id;

  CreateOrderEvent(
      {required this.storeId,
     required this.gasBottle_id,
     required this.quantity,
     required this.aggregator_method_id});
}
