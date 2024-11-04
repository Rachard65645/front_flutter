import 'package:gas/station/data/services/station_service.dart';
import 'package:gas/stations/data/model/station_model.dart';

class StationRepository {
  final StationService service;

  StationRepository({required this.service});

  Future<StationModel> fetchStation({required String id}) async {
    final data = await service.fetchStation(id: id);
    return StationModel.fromJson(data);
  }

  Future<StationModel> createStation({required String name}) async {
    final data = await service.createStation(name: name);
    return StationModel.fromJson(data);
  }

  Future<StationModel> deleteStation({required String id}) async {
    final data = await service.deleteStation(id: id);
    return data;
  }

  Future<StationModel> updateStation(
      {required String id, required String name}) async {
    final data = await service.updateStation(id: id, name: name);
    return StationModel.fromJson(data);
  }
}
