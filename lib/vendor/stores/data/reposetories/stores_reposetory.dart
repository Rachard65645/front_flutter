import 'package:gas/vendor/store/data/model/store_model.dart';
import 'package:gas/vendor/stores/data/services/stores_service.dart';

class StoresReposetory {
  final StoresService service;

  StoresReposetory({required this.service});

  Future<List<StoreModel>> getStores() async {
    final data = await service.getStores();
    return (data['stores'] as List)
        .map((json) => StoreModel.fromJson(json))
        .toList();
  }
}
