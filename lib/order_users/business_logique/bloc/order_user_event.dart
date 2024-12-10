part of 'order_user_bloc.dart';

@immutable
sealed class OrderUserEvent {}

final class FetchOrderUserEvent extends OrderUserEvent {}