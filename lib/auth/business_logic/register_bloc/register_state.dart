part of 'register_bloc.dart';

@immutable
sealed class RegisterState {
  final UserModel? user;

  const RegisterState({this.user});
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  const RegisterSuccess({required super.user});
}

final class RegisterFailure extends RegisterState {
  final String message;
  const RegisterFailure({required this.message});
}
