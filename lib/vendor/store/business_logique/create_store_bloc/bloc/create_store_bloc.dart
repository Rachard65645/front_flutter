import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_store_event.dart';
part 'create_store_state.dart';

class CreateStoreBloc extends Bloc<CreateStoreEvent, CreateStoreState> {
  CreateStoreBloc() : super(CreateStoreInitial()) {
    on<CreateStoreEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
