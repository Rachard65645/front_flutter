part of 'stations_bloc.dart';

@immutable
sealed class StationsState {
  final List<StationModel>? stations;

  const StationsState({this.stations});
}

final class StationsInitial extends StationsState {}

final class StationsLoading extends StationsState {}

final class GetStationSSuccess extends StationsState {
  const GetStationSSuccess({required super.stations});
}

final class StationsFailure extends StationsState {
  final String message;

  const StationsFailure({required this.message});
}
