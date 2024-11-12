import 'package:gas/vendor/store/data/model/store_model.dart';
import 'package:gas/vendor/store/data/services/store_service.dart';
import 'package:gas/vendor/stores/data/model/stores_model.dart';

class StoreRepository {
  final StoreService service;

  StoreRepository({required this.service});

  Future<StoresModel> getStoreId({required String id}) async {
    final data = await service.getStoreId(id: id);
    return StoresModel.fromJson(data['stores']);
  }

  Future<StoreModel> createStore({
    required String name,
    required String address,
    required String city,
    required String logo,
    required String pseudo,
  }) async {
    final data = await service.createStore(
        name: name, address: address, city: city, logo: logo, pseudo: pseudo,);
    return StoreModel.fromJson(data);
  }
}
