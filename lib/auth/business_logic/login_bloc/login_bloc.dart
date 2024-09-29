import 'package:bloc/bloc.dart';
import 'package:gas/auth/data/models/user_model.dart';
import 'package:gas/auth/data/repositories/login_repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;
  LoginBloc({required this.repository}) : super(LoginInitial()) {
    on<LoginAuthEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        final user = await repository.login(
            email: event.email, password: event.password);
        emit(LoginSuccess(userModel: user));
      } catch (err) {
        emit(LoginFailure(message: err.toString()));
      }
    });

    on<CheckAuthStateEvent>((event, emit) async {
      try {
        final SharedPreferences preferences =
            await SharedPreferences.getInstance();
        var value = preferences.getBool('is_first_time_launch');

        if (value == false) {
          var user = await repository.currentUser();
          if (user != null) {
            emit(CheckAuthStateSuccess(userModel: user));
          }

          emit(CheckAuthStateFailure());
          return;
        }

        emit(FistTimeLaunch());
      } catch (err) {
        emit(CheckAuthStateFailure());
      }
    });
  }
}
