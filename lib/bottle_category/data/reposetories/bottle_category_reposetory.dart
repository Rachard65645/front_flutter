import 'package:gas/bottle_categories/data/model/bottle_category_model.dart';
import 'package:gas/bottle_category/data/services/bottle_category_service.dart';

class BottleCategoryReposetory {
  final BottleCategoryService service;

  BottleCategoryReposetory({required this.service});

  Future<BottleCategoryModel> fetchBottleCategory({required String id}) async {
    final data = await service.fetchBottleCategory(id: id);
    return BottleCategoryModel.fromJson(data);
  }

  Future<BottleCategoryModel> createBottleCategory(
      {required String brand, required num weigth}) async {
    final data =
        await service.createBottleCategory(brand: brand, weigth: weigth);
    return BottleCategoryModel.fromJson(data);
  }

  Future<BottleCategoryModel> pathBottleCategory(
      {required String id, required String brand, required num weigth}) async {
    final data =
        await service.pathBottleCategory(id: id, brand: brand, weigth: weigth);
    return BottleCategoryModel.fromJson(data);
  }

  Future<BottleCategoryModel> deleteBottleCategory({required String id}) async {
    final data = await service.deleteBottleCategory(id: id);
    return BottleCategoryModel.fromJson(data);
  }
}
