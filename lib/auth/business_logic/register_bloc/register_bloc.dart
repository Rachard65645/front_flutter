import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/auth/data/models/user_model.dart';
import 'package:gas/auth/data/repositories/register_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository repository;
  RegisterBloc({
    required this.repository,
  }) : super(RegisterInitial()) {
    on<RegisterAuthEvent>((event, emit) async {
      try {
        emit(RegisterLoading());
        final register = await repository.register(
            name: event.name,
            email: event.email,
            password: event.password,
            phone: event.phone,
          );
        emit(RegisterSuccess(user: register));
      } catch (err) {
        emit(RegisterFailure(message: err.toString()));
      }
    });
  }
}
