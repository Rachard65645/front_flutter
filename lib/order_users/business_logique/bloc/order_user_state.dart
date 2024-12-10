part of 'order_user_bloc.dart';

@immutable
sealed class OrderUserState {
  final List<OrderUserModel>? orderUser;

  const OrderUserState({this.orderUser});
}

final class OrderUserInitial extends OrderUserState {}

final class OrderUserLoading extends OrderUserState {}

final class OrderUserSucess extends OrderUserState {
  const OrderUserSucess({required super.orderUser});
}

final class OrderUserFailure extends OrderUserState {
  final String message;

  const OrderUserFailure({required this.message});
}
