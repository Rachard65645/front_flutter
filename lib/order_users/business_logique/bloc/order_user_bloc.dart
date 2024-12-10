import 'package:bloc/bloc.dart';
import 'package:gas/order_users/data/model/order_user_model.dart';
import 'package:gas/order_users/data/reposetories/order_user_reposetories.dart';
import 'package:meta/meta.dart';

part 'order_user_event.dart';
part 'order_user_state.dart';

class OrderUserBloc extends Bloc<OrderUserEvent, OrderUserState> {
  final OrderUserReposetories reposetories;
  OrderUserBloc({required this.reposetories}) : super(OrderUserInitial()) {
    on<FetchOrderUserEvent>((event, emit) async {
      try {
        emit(OrderUserLoading());
        final orderUser = await reposetories.orderUser();
        emit(OrderUserSucess(orderUser: orderUser));
      } catch (err) {
        emit(OrderUserFailure(message: err.toString()));
      }
    });
  }
}
