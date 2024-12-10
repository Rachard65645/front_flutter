import 'package:gas/vendor/store_user/data/model/store_user_model.dart';
import 'package:gas/vendor/store_user/data/services/store_user_service.dart';

class StoreUserReposetory {
  final StoreUserService service;

  StoreUserReposetory({required this.service});

  Future<List<StoreUserModel>> my_store() async {
    final data = await service.my_store();
    return (data as List).map((json) => StoreUserModel.fromJson(json)).toList();
  }
}
