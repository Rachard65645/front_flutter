part of 'station_bloc.dart';

@immutable
sealed class StationEvent {}

final class CreateStationEvent extends StationEvent {
  final String name;

  CreateStationEvent({required this.name});
}

final class UpdateStationEvent extends StationEvent {
  final String id;
  final String name;

  UpdateStationEvent({required this.id,  required this.name});
}

final class FetchStationEvent extends StationEvent {
  final String id;

  FetchStationEvent({required this.id});
}

final class DeleteStationEvent extends StationEvent {
  final String id;

  DeleteStationEvent({required this.id});
}

