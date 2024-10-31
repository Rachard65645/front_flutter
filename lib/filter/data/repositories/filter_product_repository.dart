import 'package:gas/filter/data/models/filter_product_model.dart';
import 'package:gas/filter/data/services/filter_product_service.dart';

class FilterProductRepository {
  final FilterProductService service;

  FilterProductRepository({required this.service});

  Future<List<FilterProductModel>> fetchProducts() async {
    final data = await service.fetchProducts();
    return (data['products'] as List)
        .map((e) => FilterProductModel.fromJson(e))
        .toList();
  }
}
