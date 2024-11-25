import 'package:bloc/bloc.dart';
import 'package:gas/orders/data/model/orders_model.dart';
import 'package:gas/orders/data/reposetories/orders_reposetory.dart';
import 'package:meta/meta.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrdersReposetory reposetory;
  OrdersBloc({required this.reposetory}) : super(OrdersInitial()) {
    on<CreateOrderEvent>((event, emit) async {
      try {
        emit(OrdersLoading());
        final orders = await reposetory.createCommande(
            storeId: event.storeId ,
            gasBottle_id: event.gasBottle_id ,
            quantity: event.quantity ,
            aggregator_method_id: event.aggregator_method_id);

        emit(CreateOrdersSuccess());
      } catch (err) {
        emit(OrdersFailure(message: err.toString()));
      }
    });
  }
}
