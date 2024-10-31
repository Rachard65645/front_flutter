import 'package:bloc/bloc.dart';
import 'package:gas/vendor/store/data/model/store_model.dart';
import 'package:gas/vendor/store/data/repositories/store_repository.dart';
import 'package:meta/meta.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StoreRepository repository;
  StoreBloc({required this.repository}) : super(StoreInitial()) {
    on<FetchStoreEvent>((event, emit) async {
      try {
        emit(Storeloading());
        final stores = await repository.getStores();
        emit(FetchStoreSuccess(stores: stores));
      } catch (err) {
        emit(StoreFailure(message: err.toString()));
      }
    });

    on<CreateStoreEvent>((event, emit) async {
      try {
        emit(Storeloading());
        final store = await repository.createStore(
            name: event.name,
            address: event.address,
            city: event.city,
            logo: event.logo,
            pseudo: event.pseudo);
        emit(CreateStoreSuccess(store: store));
      } catch (err) {
        emit(StoreFailure(message: err.toString()));
      }
    });
  }
}
