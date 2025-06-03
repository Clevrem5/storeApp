import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_service_state.freezed.dart';

enum Status { initial, loading, success, error }

@freezed
abstract class CustomerServiceState with _$CustomerServiceState {
  const factory CustomerServiceState({
    required Status status,
    required List<Map<String, dynamic>> messages,
  }) = _CustomerServiceState;

  factory CustomerServiceState.initial() {
    return CustomerServiceState(status: Status.initial, messages: []);
  }
}
