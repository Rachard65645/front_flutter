part of 'bottle_categories_bloc.dart';

@immutable
sealed class BottleCategoriesEvent {}

final class GetBottleCategoriesEvent extends BottleCategoriesEvent{}