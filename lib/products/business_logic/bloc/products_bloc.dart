import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:gas/products/data/models/product_model.dart';
import 'package:gas/products/data/repositories/product_repository.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository repository;
  ProductsBloc({required this.repository}) : super(ProductsInitial()) {
    on<FetchProductEven>((event, emit) async {
      try {
        emit(FetchProductLoading());
        final products = await repository.fetchProduct();
        emit(FetchProductSuccess(products: products));
      } catch (err) {
        emit(FetchProductFailure(message: e.toString()));
      }
    });
  }
}
