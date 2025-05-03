import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/models/notification_model/notification_model.dart';

part 'notification_state.freezed.dart';

enum NotificationStatus { idle, loading, initial, error }

@freezed
abstract class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(<NotificationModel>[]) List<NotificationModel> notification,
    @Default(NotificationStatus.initial) NotificationStatus status,
  }) = _NotificationState;

  factory NotificationState.initial() {
    return NotificationState(
      notification: [],
      status: NotificationStatus.initial,
    );
  }
}
