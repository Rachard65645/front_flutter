part of 'bottle_category_bloc.dart';

@immutable
sealed class BottleCategoryState {
  final BottleCategoryModel? bottleCategory;
  final String? message;

  const BottleCategoryState({this.bottleCategory, this.message});
}

final class BottleCategoryInitial extends BottleCategoryState {}

final class BottleCategoryLoading extends BottleCategoryState {
  const BottleCategoryLoading({super.bottleCategory, super.message});
}

final class FetchBottleCategorySuccess extends BottleCategoryState {
  const FetchBottleCategorySuccess({required super.bottleCategory});
}

final class CreateBottleCategorySuccess extends BottleCategoryState {
  const CreateBottleCategorySuccess({required super.bottleCategory});
}

final class DeleteBottleCategorySuccess extends BottleCategoryState {
  const DeleteBottleCategorySuccess({required super.bottleCategory});
}

final class PathBottleCategorySuccess extends BottleCategoryState {
  const PathBottleCategorySuccess({required super.bottleCategory});
}

final class BottleCategoryFailure extends BottleCategoryState {
  const BottleCategoryFailure({super.bottleCategory, super.message});
}