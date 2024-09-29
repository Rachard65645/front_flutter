import 'package:gas/products/data/models/product_model.dart';
import 'package:gas/products/data/services/product_service.dart';

class ProductRepository {
  final ProductService service;

  ProductRepository({required this.service});

  Future<List<ProductModel>> fetchProduct() async {
    final data = await service.fetchProduct();
    return (data['products/get'] as List)
      .map((json) => ProductModel.fromJom(json))
      .toList();
  }
}
