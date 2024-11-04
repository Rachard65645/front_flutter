part of 'station_bloc.dart';

@immutable
sealed class StationState {
  final StationModel? station;
  final String? message;

  const StationState({this.station, this.message});
}

final class StationInitial extends StationState {}

final class StationLoading extends StationState {}

final class CreateStationSuccess extends StationState {
  const CreateStationSuccess({required super.station});
}

final class UpdateStationSuccess extends StationState {
  const UpdateStationSuccess({required super.station});
}

final class FetchStationSuccess extends StationState {
  const FetchStationSuccess({required super.station});
}

final class DeleteStationSuccess extends StationState {
  const DeleteStationSuccess({required super.station});
}

final class StationFailure extends StationState {
  const StationFailure({required super.message});
}
