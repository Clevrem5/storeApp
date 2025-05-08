import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/mycart/my_cart_model.dart';
part 'my_cart_state.freezed.dart';

enum MyCartStatus { idle, loading, error }

@freezed
abstract class MyCartState with _$MyCartState {
  const factory MyCartState({
    required MyCartModel? data,
    required MyCartStatus status,
  }) = _MyCartState;

  factory MyCartState.initial(){
    return MyCartState(data: null, status: MyCartStatus.loading);
  }

}
