part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginAuthEvent extends LoginEvent {
  final String email;
  final String password;

  LoginAuthEvent({required this.email, required this.password});
}

class CheckAuthStateEvent extends LoginEvent {}
