import 'package:bloc/bloc.dart';
import 'package:gas/bottle_categories/data/model/bottle_category_model.dart';
import 'package:gas/bottle_categories/data/reposetories/bottle_categories_reposetory.dart';
import 'package:meta/meta.dart';

part 'bottle_categories_event.dart';
part 'bottle_categories_state.dart';

class BottleCategoriesBloc
    extends Bloc<BottleCategoriesEvent, BottleCategoriesState> {
  final BottleCategoriesReposetory reposetory;
  BottleCategoriesBloc({required this.reposetory})
      : super(BottleCategoriesInitial()) {
    on<BottleCategoriesEvent>((event, emit) async {
      try {
        emit(BottleCategoriesLoading());
        final bottleCategories = await reposetory.getBottleCategories();
        emit(BottleCategoriesSuccess(bottleCategories: bottleCategories));
      } catch (err) {
        emit(BottleCategoriesFailure(message: err.toString()));
      }
    });
  }
}
