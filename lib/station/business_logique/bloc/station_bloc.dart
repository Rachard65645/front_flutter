import 'package:bloc/bloc.dart';
import 'package:gas/station/data/repositories/station_repository.dart';
import 'package:gas/stations/data/model/station_model.dart';
import 'package:meta/meta.dart';

part 'station_event.dart';
part 'station_state.dart';

class StationBloc extends Bloc<StationEvent, StationState> {
  final StationRepository repository;
  StationBloc({required this.repository}) : super(StationInitial()) {
    on<CreateStationEvent>((event, emit) async {
      try {
        emit(StationLoading());
        final station = await repository.createStation(name: event.name);
        emit(CreateStationSuccess(station: station));
      } catch (err) {
        emit(StationFailure(message: err.toString()));
      }
    });

    on<UpdateStationEvent>((event, emit) async {
      try {
        emit(StationLoading());
        final station =
            await repository.updateStation(id: event.id, name: event.name);
        emit(UpdateStationSuccess(station: station));
      } catch (err) {
        emit(StationFailure(message: err.toString()));
      }
    });

    on<DeleteStationEvent>((event, emit) async {
      try {
        emit(StationLoading());
        final station = await repository.deleteStation(id: event.id);
        emit(DeleteStationSuccess(station: station));
      } catch (err) {
        emit(StationFailure(message: err.toString()));
      }
    });

    on<FetchStationEvent>((event, emit) async {
      try {
        emit(StationLoading());
        final station = await repository.fetchStation(id: event.id);
        emit(FetchStationSuccess(station: station));
      } catch (err) {
        emit(StationFailure(message: err.toString()));
      }
    });
  }
}
