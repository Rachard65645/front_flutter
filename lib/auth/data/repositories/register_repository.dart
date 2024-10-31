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
    required String city,
    required String address,
  }) async {
    var data = await service.register(
      name: name,
      email: email,
      password: password,
      phone: phone,
      city: city,
      address: address,
    );

    return UserModel.fromJson(data);
  }
}
