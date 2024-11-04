part of 'bottle_category_bloc.dart';

@immutable
sealed class BottleCategoryEvent {}

final class FetchBottleCategoryEvent extends BottleCategoryEvent {
  final String id;
  FetchBottleCategoryEvent({required this.id});
}

final class CreateBottleCategoryEvent extends BottleCategoryEvent {
  final String brand;
  final num weigth;
  CreateBottleCategoryEvent({required this.brand, required this.weigth});
}

final class PathBottleCategoryEvent extends BottleCategoryEvent {
  final String id;
  final String brand;
  final num weigth;
  PathBottleCategoryEvent(
      {required this.id, required this.brand, required this.weigth});
}

final class DeleteBottleCategoryEvent extends BottleCategoryEvent {
  final String id;
  DeleteBottleCategoryEvent({required this.id});
}

