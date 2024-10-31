import 'package:bloc/bloc.dart';
import 'package:gas/vendor/seller/data/model/seller_model.dart';
import 'package:gas/vendor/sellers/data/reposetories/sellers_reposetory.dart';
import 'package:meta/meta.dart';
part 'sellers_event.dart';
part 'sellers_state.dart';

class SellersBloc extends Bloc<SellersEvent, SellersState> {
  final SellersReposetory repository;
  SellersBloc({required this.repository}) : super(SellersInitial()) {
    on<GetSellerEvent>((event, emit) async {
      try {
        emit(SellersListLoading());
        final sellers = await repository.getSeller();
        emit(GetSellerSuccessState(sellers: sellers));
      } catch (err) {
        emit(SellersFailureState(message: err.toString()));
      }
    });
  }
}
