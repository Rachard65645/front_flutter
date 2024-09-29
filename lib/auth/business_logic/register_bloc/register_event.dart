part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterAuthEvent extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String city;
  final String address;

  RegisterAuthEvent(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone,
      required this.city,
      required this.address,
      });
}
