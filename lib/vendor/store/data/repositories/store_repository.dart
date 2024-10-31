import 'package:gas/vendor/store/data/model/store_model.dart';
import 'package:gas/vendor/store/data/services/store_service.dart';

class StoreRepository {
  final StoreService service;

  StoreRepository({required this.service});

  Future<List<StoreModel>> getStores() async {
    final data = await service.getStores();
    return (data['stores'] as List)
        .map((json) => StoreModel.fromJson(json))
        .toList();
  }

  Future<StoreModel> createStore({
    required String name,
    required String address,
    required String city,
    required String logo,
    required String pseudo,
  }) async {
    final data = await service.createStore(
        name: name, address: address, city: city, logo: logo, pseudo: pseudo);
    return StoreModel.fromJson(data);
  }
}
