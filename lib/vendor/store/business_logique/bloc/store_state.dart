part of 'store_bloc.dart';

@immutable
sealed class StoreState {
  final StoreModel? store;

  const StoreState({this.store});
}

final class StoreInitial extends StoreState {}

final class Storeloading extends StoreState {}

final class CreateStoreSuccess extends StoreState {
  const CreateStoreSuccess({required super.store});
}

final class StoreFailure extends StoreState {
  final String message;
  const StoreFailure({required this.message}); 
  
}
