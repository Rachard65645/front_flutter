part of 'position_bloc.dart';

@immutable
sealed class PositionEvent {}

final class GetPositionEvent extends PositionEvent {}