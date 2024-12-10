import 'package:bloc/bloc.dart';
import 'package:gas/vendor/search_store/data/model/search_model.dart';
import 'package:gas/vendor/search_store/data/reposetories/search_stores_reposetories.dart';
import 'package:meta/meta.dart';

part 'search_stores_event.dart';
part 'search_stores_state.dart';

class SearchStoresBloc extends Bloc<SearchStoresEvent, SearchStoresState> {
  final SearchStoresReposetories reposetories;
  SearchStoresBloc({required this.reposetories})
      : super(SearchStoresInitial()) {
    on<SearchAllStoresEvent>((event, emit) async {
      try {
        emit(SearchStoreLoading());
        final search = await reposetories.searchStore(
            name: event.name ?? '', address: event.address ?? '');
        emit(SearchStoreSuccess(search: search));
      } catch (err) {
        emit(SearchStoreFailure(message: err.toString()));
      }
    });
  }
}
