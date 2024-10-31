part of 'filter_product_bloc.dart';

@immutable
sealed class FilterProductEvent {}

final class FetchFilterProduct extends FilterProductEvent{}
