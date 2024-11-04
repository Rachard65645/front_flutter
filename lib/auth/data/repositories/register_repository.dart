import 'package:gas/auth/data/models/user_model.dart';
import 'package:gas/auth/data/service/register_service.dart';

class RegisterRepository {
  final RegisterService service;

  RegisterRepository({required this.service});

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    var data = await service.register(
      name: name,
      email: email,
      password: password,
      phone: phone,
    );

    return UserModel.fromJson(data);
  }
}
