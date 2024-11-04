part of 'seller_bloc.dart';

@immutable
sealed class SellerState {
  final SellerModel? seller;
  final String? message;
  const SellerState({this.seller, this.message});
}

final class SellerListInitial extends SellerState {}

final class SellerListLoading extends SellerState {}

final class GetSellerByIdSuccessState extends SellerState {
  const GetSellerByIdSuccessState({required super.seller});
}

final class CreateSellerSuccessState extends SellerState {
  const CreateSellerSuccessState({required super.seller});
}

final class ValidateSellerSuccessState extends SellerState {
  const ValidateSellerSuccessState({required super.seller});
}

final class RefuseSellerSuccessState extends SellerState {
  const RefuseSellerSuccessState({required super.seller});
}

final class SellerFailureState extends SellerState {
  const SellerFailureState({required super.message});
}

final class DeleteSellerSuccessState extends SellerState {
  const DeleteSellerSuccessState({required super.seller});
}
