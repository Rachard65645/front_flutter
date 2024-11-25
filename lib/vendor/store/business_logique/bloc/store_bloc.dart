import 'package:bloc/bloc.dart';
import 'package:gas/vendor/store/data/model/store_model.dart';
import 'package:gas/vendor/store/data/repositories/store_repository.dart';
import 'package:gas/vendor/stores/data/model/stores_model.dart';
import 'package:meta/meta.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StoreRepository repository;
  StoreBloc({required this.repository}) : super(StoreInitial()) {
    on<CreateStoreEvent>((event, emit) async {
      try {
        emit(Storeloading());
        final storeCreate = await repository.createStore(
            name: event.name,
            address: event.address,
            city: event.city,
            logo: event.logo,
            pseudo: event.pseudo,
            statusStore: event.statusStore,
            aboutStore: event.aboutStore
            );
        emit(CreateStoreSuccess(storeCreate: storeCreate));
      } catch (err) {
        emit(StoreFailure(message: err.toString()));
      }
    });

    on<GetStoreByIdEven>((event, emit) async {
      try {
        emit(Storeloading());
        final store = await repository.getStoreId(id: event.id);
        emit(GetStoreByIdSuccess(store: store));
      } catch (err) {
        emit(StoreFailure(message: err.toString()));
      }
    });
  }
}
