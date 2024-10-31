part of 'sellers_bloc.dart';

@immutable
sealed class SellersEvent {}

final class GetSellerEvent extends SellersEvent {}
