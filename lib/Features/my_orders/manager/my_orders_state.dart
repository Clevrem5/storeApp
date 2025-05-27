import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/my_orders_model/my_orders_model.dart';

part 'my_orders_state.freezed.dart';

enum MyOrdersStatus { loading, success, error }

@freezed
abstract class MyOrdersState with _$MyOrdersState {
  const factory MyOrdersState({
    required MyOrdersStatus status,
    required List<MyOrdersModel> orders,
  }) = _MyOrdersState;

  factory MyOrdersState.initial() => const MyOrdersState(
    status: MyOrdersStatus.loading,
    orders: [],
  );
}
