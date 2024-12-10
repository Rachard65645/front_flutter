part of 'store_user_bloc.dart';

@immutable
sealed class StoreUserState {
  final List<StoreUserModel>? stores;

  const StoreUserState({this.stores});
}

final class StoreUserInitial extends StoreUserState {}

final class StoreUserLoading extends StoreUserState {}

final class StoreUserSuccess extends StoreUserState {
  const StoreUserSuccess({required super.stores});
}

final class StoreUserfailure extends StoreUserState {
  final String message;
  const StoreUserfailure({required this.message});
}
