part of 'orders_bloc.dart';

@immutable
sealed class OrdersState {
  final OrdersModel? orders;

  const OrdersState({this.orders});
}

final class OrdersInitial extends OrdersState {}

final class OrdersLoading extends OrdersState {}

final class CreateOrdersSuccess extends OrdersState {
}

final class OrdersFailure extends OrdersState {
  final String message;

  const OrdersFailure({required this.message});
}
