part of 'seller_bloc.dart';

@immutable
sealed class SellerEvent {}


final class GetSellerByIdEvent extends SellerEvent {
  final String id;
  GetSellerByIdEvent({required this.id});
}

final class CreateSellerEvent extends SellerEvent {
  final String cni;
  final String rccm;
  final String patente;
  final String cc;
  CreateSellerEvent(
      {required this.cni,
      required this.rccm,
      required this.patente,
      required this.cc});
}

final class ValidateSellerEvent extends SellerEvent {
  final String id;
  ValidateSellerEvent({required this.id});
}

final class RefuseSellerEvent extends SellerEvent {
  final String id;
  RefuseSellerEvent({required this.id});
}

final class DeleteSellerEvent extends SellerEvent {
  final String id;
  DeleteSellerEvent({required this.id});
}
