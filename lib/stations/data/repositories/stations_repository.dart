import 'package:gas/stations/data/model/station_model.dart';
import 'package:gas/stations/data/services/stations_service.dart';

class StationsRepository {
  final StationsService service;

  StationsRepository({required this.service});

  Future<List<StationModel>> getStations() async {
    final data = await service.getStations();
    return (data['stations'] as List)
        .map((json) => StationModel.fromJson(json))
        .toList();
  }
}
