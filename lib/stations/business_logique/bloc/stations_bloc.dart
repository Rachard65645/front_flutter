import 'package:bloc/bloc.dart';
import 'package:gas/stations/data/model/station_model.dart';
import 'package:gas/stations/data/repositories/stations_repository.dart';
import 'package:meta/meta.dart';

part 'stations_event.dart';
part 'stations_state.dart';

class StationsBloc extends Bloc<StationsEvent, StationsState> {
  final StationsRepository repository;
  StationsBloc({required this.repository}) : super(StationsInitial()) {
    on<StationsEvent>((event, emit) async {
      try {
        emit(StationsLoading());
        final stations = await repository.getStations();
        emit(GetStationSSuccess(stations: stations));
      } catch (err) {
        emit(StationFailure(message: err.toString()));
      }
    });
  }
}
