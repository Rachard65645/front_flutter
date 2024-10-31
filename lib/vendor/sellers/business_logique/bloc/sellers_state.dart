part of 'sellers_bloc.dart';

@immutable
sealed class SellersState {
  final List<SellerModel>? sellers;

  const SellersState({this.sellers});
}

final class SellersInitial extends SellersState {}

final class SellersListLoading extends SellersState {}

final class GetSellerSuccessState extends SellersState {
  const GetSellerSuccessState({required super.sellers});
}

final class SellersFailureState extends SellersState {
  final String message;
  const SellersFailureState({required this.message});
}
