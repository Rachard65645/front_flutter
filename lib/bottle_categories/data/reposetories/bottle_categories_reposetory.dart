import 'package:gas/bottle_categories/data/model/bottle_category_model.dart';
import 'package:gas/bottle_categories/data/services/bottle_categories_service.dart';

class BottleCategoriesReposetory {
  final BottleCategoriesService service;

  BottleCategoriesReposetory({required this.service});

  Future<List<BottleCategoryModel>> getBottleCategories() async {
    final data = await service.getBottleCategories();
    return (data['categories'] as List)
        .map((json) => BottleCategoryModel.fromJson(json))
        .toList();
  }
}
