part of 'gas_bottles_bloc.dart';

@immutable
sealed class GasBottlesState {
  final List<GasBottleModel>? bottles;

  const GasBottlesState({this.bottles});
}

final class GasBottlesInitial extends GasBottlesState {}

final class GasBottlesLoading extends GasBottlesState {}

final class GetGasBottlesSuccess extends GasBottlesState {
  const GetGasBottlesSuccess({required super.bottles});
}

final class GasBottlesFailure extends GasBottlesState {
  final String message;

 const GasBottlesFailure({required this.message});
}
