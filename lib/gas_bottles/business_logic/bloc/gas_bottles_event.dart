part of 'gas_bottles_bloc.dart';

@immutable
sealed class GasBottlesEvent {}

final class GetBottlesEvent extends GasBottlesEvent {}
