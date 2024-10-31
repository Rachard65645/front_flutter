import 'package:bloc/bloc.dart';
import 'package:gas/filter/data/models/filter_product_model.dart';
import 'package:gas/filter/data/repositories/filter_product_repository.dart';
import 'package:meta/meta.dart';

part 'filter_product_event.dart';
part 'filter_product_state.dart';

class FilterProductBloc extends Bloc<FilterProductEvent, FilterProductState> {
  final FilterProductRepository repository;
  FilterProductBloc({required this.repository})
      : super(FilterProductInitial()) {
    on<FilterProductEvent>((event, emit) async {
      try {
        emit(FilterproductLoading());
        final produts = await repository.fetchProducts();
        emit(FilerproductSucces(product: produts));
      } catch (e) {
        emit(FilerproductFailure(massage: e.toString()));
      }
    });
  }
}
