part of 'stores_bloc.dart';

@immutable
sealed class StoresState {
  final List<StoreModel>? stores;

 const StoresState({ this.stores});
}

final class StoresInitial extends StoresState {}

final class Storesloading extends StoresState {}



final class FetchStoreSuccess extends StoresState {
  const FetchStoreSuccess({required super.stores});
}

final class StoresFailure extends StoresState {
  final String message;
  const StoresFailure({required this.message}); 
  
}