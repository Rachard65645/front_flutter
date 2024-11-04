import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/vendor/seller/data/model/seller_model.dart';
import 'package:gas/vendor/seller/data/reposetories/seller_reposetories.dart';

part 'seller_event.dart';
part 'seller_state.dart';

class SellerBloc extends Bloc<SellerEvent, SellerState> {
  final SellerReposetories repository;
  SellerBloc({required this.repository}) : super(SellerListInitial()) {

    on<GetSellerByIdEvent>((event, emit) async {
      try {
        emit(SellerListLoading());
        final seller = await repository.getSellerById(id: event.id);
        emit(GetSellerByIdSuccessState(seller: seller));
      } catch (err) {
        emit(SellerFailureState(message: err.toString()));
      }
    });

    on<CreateSellerEvent>((event, emit) async {
      try {
        emit(SellerListLoading());
        final seller = await repository.createSeller(
            cni: event.cni,
            rccm: event.rccm,
            patente: event.patente,
            cc: event.cc);
        emit(CreateSellerSuccessState(seller: seller));
      } catch (err) {
        emit(SellerFailureState(message: err.toString()));
      }
    });

    on<ValidateSellerEvent>(
      (event, emit) async {
        try {
          emit(SellerListLoading());
          final validate = await repository.validateSeller(id: event.id);
          emit(ValidateSellerSuccessState(seller: validate));
        } catch (err) {
           emit(SellerFailureState(message: err.toString()));
        }
      },
    );

     on<RefuseSellerEvent>(
      (event, emit) async {
        try {
          emit(SellerListLoading());
          final validate = await repository.refuseSeller(id: event.id);
          emit(RefuseSellerSuccessState(seller: validate));
        } catch (err) {
           emit(SellerFailureState(message: err.toString()));
        }
      },
    );

    on<DeleteSellerEvent>(
      (event, emit) async {
        try {
          emit(SellerListLoading());
          final validate = await repository.deleteSeller(id: event.id);
          emit(DeleteSellerSuccessState(seller: validate));
        } catch (err) {
           emit(SellerFailureState(message: err.toString()));
        }
      },
    );


  }

  
}
