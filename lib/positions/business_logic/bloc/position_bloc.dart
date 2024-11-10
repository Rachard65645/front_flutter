import 'package:bloc/bloc.dart';
import 'package:gas/positions/data/model/position_model.dart';
import 'package:gas/positions/data/reposetories/position_reposetory.dart';
import 'package:meta/meta.dart';

part 'position_event.dart';
part 'position_state.dart';

class PositionBloc extends Bloc<PositionEvent, PositionState> {
  final PositionReposetory reposetory;
  PositionBloc({required this.reposetory}) : super(PositionInitial()) {
    on<GetPositionEvent>((event, emit) async {
      try {
        emit(PositionLoading());
        final position = await reposetory.getPosition();
        emit(PositionSuccess(position: position));
      } catch (err) {
        emit(PositionFailure(message: err.toString()));
      }
    });
  }
}
