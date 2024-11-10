import 'package:bloc/bloc.dart';
import 'package:gas/vendor/store/data/model/store_model.dart';
import 'package:gas/vendor/stores/data/reposetories/stores_reposetory.dart';
import 'package:meta/meta.dart';

part 'stores_event.dart';
part 'stores_state.dart';

class StoresBloc extends Bloc<StoresEvent, StoresState> {
  final StoresReposetory reposetory;
  StoresBloc({required this.reposetory}) : super(StoresInitial()) {
    on<FetchStoreEvent>((event, emit) async {
      try {
        emit(Storesloading());
        final stores = await reposetory.getStores();
        emit(FetchStoreSuccess(stores: stores));
      } catch (err) {
        emit(StoresFailure(message: err.toString()));
      }
    });
  }
}
