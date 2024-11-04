import 'package:bloc/bloc.dart';
import 'package:gas/bottle_categories/data/model/bottle_category_model.dart';
import 'package:gas/bottle_category/data/reposetories/bottle_category_reposetory.dart';
import 'package:meta/meta.dart';

part 'bottle_category_event.dart';
part 'bottle_category_state.dart';

class BottleCategoryBloc
    extends Bloc<BottleCategoryEvent, BottleCategoryState> {
  final BottleCategoryReposetory reposetory;
  BottleCategoryBloc({required this.reposetory})
      : super(BottleCategoryInitial()) {
    on<FetchBottleCategoryEvent>((event, emit) async {
      try {
        final bottleCategory =
            await reposetory.fetchBottleCategory(id: event.id);
        emit(BottleCategoryLoading(bottleCategory: bottleCategory));
        emit(FetchBottleCategorySuccess(bottleCategory: bottleCategory));
      } catch (err) {
        final bottleCategory =
            await reposetory.fetchBottleCategory(id: event.id);
        emit(BottleCategoryFailure(
            message: err.toString(), bottleCategory: bottleCategory));
      }
    });

    on<CreateBottleCategoryEvent>((event, emit) async {
      try {
        final bottleCategory = await reposetory.createBottleCategory(
            brand: event.brand, weigth: event.weigth);
        emit(const BottleCategoryLoading());
        emit(CreateBottleCategorySuccess(bottleCategory: bottleCategory));
      } catch (err) {
        emit(BottleCategoryFailure(message: err.toString()));
      }
    });

    on<PathBottleCategoryEvent>((event, emit) async {
      try {
        final bottleCategory = await reposetory.pathBottleCategory(
            id: event.id, brand: event.brand, weigth: event.weigth);
        emit(const BottleCategoryLoading());
        emit(PathBottleCategorySuccess(bottleCategory: bottleCategory));
      } catch (err) {
        emit(BottleCategoryFailure(message: err.toString()));
      }
    });

    on<DeleteBottleCategoryEvent>((event, emit) async {
      try {
        final bottleCategory =
            await reposetory.deleteBottleCategory(id: event.id);
            emit(const BottleCategoryLoading());
             emit(DeleteBottleCategorySuccess(bottleCategory: bottleCategory));
      } catch (err) {
            emit(const BottleCategoryFailure());
      }
    });
  }
}
