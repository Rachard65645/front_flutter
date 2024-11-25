part of 'store_bloc.dart';

@immutable
sealed class StoreEvent {}

final class GetStoreByIdEven extends StoreEvent {
  final String id;
  GetStoreByIdEven({required this.id});
}

final class CreateStoreEvent extends StoreEvent {
  final String name;
  final String pseudo;
  final String city;
  final String logo;
  final String address;
  final String statusStore;
  final String aboutStore;

  CreateStoreEvent(
      {required this.name,
      required this.pseudo,
      required this.city,
      required this.logo,
      required this.address,
      required this.statusStore,
      required this.aboutStore,
      });
}
