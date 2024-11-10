import 'package:gas/positions/data/model/position_model.dart';
import 'package:gas/positions/data/services/position_service.dart';

class PositionReposetory {
  final PositionService service;

  PositionReposetory({required this.service});

  Future<PositionModel> getPosition() async {
    final data = await service.getPosition();
    return PositionModel.fromJson(data);
  }
}
