part of 'position_bloc.dart';

@immutable
sealed class PositionState {
  final PositionModel? position;

  const PositionState({this.position});
}

final class PositionInitial extends PositionState {}

final class PositionLoading extends PositionState {}

final class PositionSuccess extends PositionState {
  const PositionSuccess({required super.position});
}

final class PositionFailure extends PositionState {
  final String message;

  const PositionFailure({ required this.message});
  
}
