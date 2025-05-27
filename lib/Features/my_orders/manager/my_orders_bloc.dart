import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/models/my_orders_model/my_orders_model.dart';

import '../../../data/repository/orders/orders_repository.dart';
import 'my_orders_state.dart';

part 'my_orders_event.dart';

class MyOrdersBloc extends Bloc<MyOrdersEvent, MyOrdersState> {
  final OrdersRepository repository;

  MyOrdersBloc({required this.repository}) : super(MyOrdersState.initial()) {
    on<FetchOngoingOrders>(_onFetchOngoingOrders);
    on<FetchCompletedOrders>(_onFetchCompletedOrders);
    on<DeleteOrder>(_onDeleteOrder);
  }

  Future<void> _onFetchOngoingOrders(FetchOngoingOrders event, Emitter<MyOrdersState> emit) async {
    emit(state.copyWith(status: MyOrdersStatus.loading));
    try {
      final allOrders = await repository.fetchOrders();
      final ongoing = allOrders.where((e) => e.status.toLowerCase() != 'completed').toList();
      emit(state.copyWith(status: MyOrdersStatus.success, orders: ongoing));
    } catch (_) {
      emit(state.copyWith(status: MyOrdersStatus.error));
    }
  }

  Future<void> _onFetchCompletedOrders(FetchCompletedOrders event, Emitter<MyOrdersState> emit) async {
    emit(state.copyWith(status: MyOrdersStatus.loading));
    try {
      final allOrders = await repository.fetchOrders();
      final completed = allOrders.where((e) => e.status.toLowerCase() == 'completed').toList();
      emit(state.copyWith(status: MyOrdersStatus.success, orders: completed));
    } catch (_) {
      emit(state.copyWith(status: MyOrdersStatus.error));
    }
  }

  Future<void> _onDeleteOrder(DeleteOrder event, Emitter<MyOrdersState> emit) async {
    try {
      // Optimistik update
      final updatedOrders = List<MyOrdersModel>.from(state.orders)..removeWhere((order) => order.id == event.id);

      emit(state.copyWith(orders: updatedOrders));

      final success = await repository.client.fetchOrdersDelete(event.id);
      if (!success) {
        // Agar o‘chirish xatolik bo‘lsa — qayta yuklash
        add(FetchOngoingOrders());
      }
    } catch (_) {
      emit(state.copyWith(status: MyOrdersStatus.error));
    }
  }
}
