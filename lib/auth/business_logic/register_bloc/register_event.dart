part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterAuthEvent extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String phone;


  RegisterAuthEvent(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone
      });
}
