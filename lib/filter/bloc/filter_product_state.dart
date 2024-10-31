part of 'filter_product_bloc.dart';

@immutable
sealed class FilterProductState {
  final List<FilterProductModel>? product;

  const FilterProductState({this.product});
}

final class FilterProductInitial extends FilterProductState {}

final class FilterproductLoading extends FilterProductState {}

final class FilerproductSucces extends FilterProductState {
  const FilerproductSucces({super.product});
}

final class FilerproductFailure extends FilterProductState {
  final String massage;

  const FilerproductFailure({super.product, required this.massage});
}
