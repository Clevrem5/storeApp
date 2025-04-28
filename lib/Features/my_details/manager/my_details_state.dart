import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_details_state.freezed.dart';
enum MyDetailsStatus { idle, loading, submitted, error }
@freezed


abstract class MyDetailsState with _$MyDetailsState {
  // final MyDetailsStatus status;

  const factory MyDetailsState({required MyDetailsStatus status,})=_MyDetailsState;
//
// MyDetailsState copyWith({MyDetailsStatus? status}) {
//   return MyDetailsState(status: status ?? this.status);
// }
//
// @override
// List<Object?> get props => [status];
}
