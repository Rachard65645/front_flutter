import 'package:gas/vendor/search_store/data/model/search_model.dart';
import 'package:gas/vendor/search_store/data/service/search_stores_service.dart';

class SearchStoresReposetories {
  final SearchStoresService service;

  SearchStoresReposetories({required this.service});

  Future<List<SearchModel>> searchStore({
    required String name,
    required String address,
  }) async {
    final data = await service.searchStore(
      name: name,
      address: address,
    );
    return (data['stores'] as List).map((json) => SearchModel.fromJson(json)).toList();
  }
}
