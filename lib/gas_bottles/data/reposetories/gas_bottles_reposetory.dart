import 'package:gas/gas_bottles/data/model/gas_bottle_model.dart';
import 'package:gas/gas_bottles/data/services/gas_bottles_service.dart';

class GasBottlesReposetory {
  final GasBottlesService service;

  GasBottlesReposetory({required this.service});

  Future<List<GasBottleModel>> getGasBottle() async {
    final data = await service.getGasBottle();
    return (data['bottles'] as List)
        .map((json) => GasBottleModel.fromJson(json))
        .toList();
  }
}
