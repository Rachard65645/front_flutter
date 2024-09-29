part of 'login_bloc.dart';

@immutable
sealed class LoginState {
  final UserModel? userModel;

  const LoginState({this.userModel});
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  const LoginSuccess({required super.userModel});
}

final class LoginFailure extends LoginState {
  final String message;

  const LoginFailure({super.userModel, required this.message});
}

final class FistTimeLaunch extends LoginState {}

final class CheckAuthStateFailure extends LoginState {}

final class CheckAuthStateSuccess extends LoginState {
  const CheckAuthStateSuccess({required super.userModel});
}
