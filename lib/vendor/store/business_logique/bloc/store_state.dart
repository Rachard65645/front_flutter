part of 'store_bloc.dart';

@immutable
sealed class StoreState {
  final List<StoreModel>? stores;
  final StoreModel? store;

  const StoreState({this.stores, this.store});
}

final class StoreInitial extends StoreState {}

final class Storeloading extends StoreState {}

final class CreateStoreSuccess extends StoreState {
  const CreateStoreSuccess({required super.store});
}

final class FetchStoreSuccess extends StoreState {
  const FetchStoreSuccess({required super.stores});
}

final class StoreFailure extends StoreState {
  final String message;
  const StoreFailure({required this.message}); 
  
}
