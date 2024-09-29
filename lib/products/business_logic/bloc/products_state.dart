part of 'products_bloc.dart';

@immutable
sealed class ProductsState {
  final List<ProductModel>? products;

  const ProductsState({this.products});
}

final class ProductsInitial extends ProductsState {}

final class FetchProductLoading extends ProductsState {}

final class FetchProductSuccess extends ProductsState {
  const FetchProductSuccess({required super.products});
}

final class FetchProductFailure extends ProductsState {
  final String message;

  const FetchProductFailure({required this.message});
}
