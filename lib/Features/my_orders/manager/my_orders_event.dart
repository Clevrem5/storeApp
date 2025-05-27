part of 'my_orders_bloc.dart';

sealed class MyOrdersEvent {}

final class FetchOngoingOrders extends MyOrdersEvent {}

final class FetchCompletedOrders extends MyOrdersEvent {}

final class DeleteOrder extends MyOrdersEvent {
  final int id;

  DeleteOrder({required this.id});
}
