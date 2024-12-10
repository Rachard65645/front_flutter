import 'package:bloc/bloc.dart';
import 'package:gas/vendor/store_user/data/model/store_user_model.dart';
import 'package:gas/vendor/store_user/data/reposetories/store_user_reposetory.dart';
import 'package:meta/meta.dart';

part 'store_user_event.dart';
part 'store_user_state.dart';

class StoreUserBloc extends Bloc<StoreUserEvent, StoreUserState> {
  final StoreUserReposetory reposetory;
  StoreUserBloc({required this.reposetory}) : super(StoreUserInitial()) {
    on<MyStoreEvnet>((event, emit) async {
      try {
        emit(StoreUserLoading());
        final store = await reposetory.my_store();
        emit(StoreUserSuccess(stores: store));
      } catch (err) {
        emit(StoreUserfailure(message: err.toString()));
      }
    });
  }
}
