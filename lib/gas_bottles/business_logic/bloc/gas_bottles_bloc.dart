import 'package:bloc/bloc.dart';
import 'package:gas/gas_bottles/data/model/gas_bottle_model.dart';
import 'package:gas/gas_bottles/data/reposetories/gas_bottles_reposetory.dart';
import 'package:meta/meta.dart';

part 'gas_bottles_event.dart';
part 'gas_bottles_state.dart';

class GasBottlesBloc extends Bloc<GasBottlesEvent, GasBottlesState> {
  final GasBottlesReposetory reposetory;
  GasBottlesBloc({required this.reposetory}) : super(GasBottlesInitial()) {
    on<GetBottlesEvent>((event, emit) async {
      try {
        emit(GasBottlesLoading());
        final bottles = await reposetory.getGasBottle();
        emit(GetGasBottlesSuccess(bottles: bottles));
      } catch (err) {
        emit(GasBottlesFailure(message: err.toString()));
      }
    });
  }
}
