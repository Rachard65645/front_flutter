part of 'bottle_categories_bloc.dart';

@immutable
sealed class BottleCategoriesState {
  final List<BottleCategoryModel>? bottleCategories;

  const BottleCategoriesState({this.bottleCategories});
}

final class BottleCategoriesInitial extends BottleCategoriesState {}

final class BottleCategoriesLoading extends BottleCategoriesState {}

final class BottleCategoriesSuccess extends BottleCategoriesState {
  const BottleCategoriesSuccess({required super.bottleCategories});
}

final class BottleCategoriesFailure extends BottleCategoriesState {
  final String message;

 const BottleCategoriesFailure({super.bottleCategories, required this.message});
}
