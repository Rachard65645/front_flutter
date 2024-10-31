import 'package:gas/auth/data/models/user_model.dart';
import 'package:gas/auth/data/service/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  final LoginService service;

  LoginRepository({required this.service});

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var data = await service.login(email: email, password: password);

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', data['token']);
    await preferences.setString('refreshToken', data['refreshToken']);

    return UserModel.fromJson(data);
  }

  Future<dynamic> currentUser() async {
    var data = await service.currentUser();
    return UserModel.fromJson(data);
  }
}
