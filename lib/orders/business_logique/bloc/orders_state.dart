part of 'orders_bloc.dart';

@immutable
sealed class OrdersState {
  final PaymentModel? payment;

  const OrdersState({this.payment});
}

final class OrdersInitial extends OrdersState {}

final class OrdersLoading extends OrdersState {}

final class CreateOrdersSuccess extends OrdersState {
  const CreateOrdersSuccess({required super.payment});
}

final class OrdersFailure extends OrdersState {
  final String message;

  const OrdersFailure({required this.message});
}
