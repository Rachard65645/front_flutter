part of 'stations_bloc.dart';

@immutable
sealed class StationsEvent {}

final class GetStationEvent extends StationsEvent{}
