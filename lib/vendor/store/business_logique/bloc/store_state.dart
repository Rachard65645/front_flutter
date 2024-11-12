part of 'store_bloc.dart';

@immutable
sealed class StoreState {
  final StoresModel? store;
  final StoreModel? storeCreate;

  const StoreState({this.storeCreate, this.store});
}

final class StoreInitial extends StoreState {}

final class Storeloading extends StoreState {}

final class GetStoreByIdSuccess extends StoreState {
  const GetStoreByIdSuccess({required super.store});
}

final class CreateStoreSuccess extends StoreState {
  const CreateStoreSuccess({required super.storeCreate});
}

final class StoreFailure extends StoreState {
  final String message;
  const StoreFailure({required this.message});
}
