import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Core/exceptions/custom_exception.dart';
import 'package:store_app/Features/notification_page/manager/notification_state.dart';
import 'package:store_app/data/repository/notification/notification_reporsitory.dart';
part 'notification_event.dart';
// part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository _repo;

  NotificationBloc({required NotificationRepository repo})
      : _repo = repo,
        super(NotificationState.initial()) {
    on<NotificationLoad>(_load);
  }

  Future<void> _load(NotificationLoad event, Emitter<NotificationState> emit) async {
    try {
      emit(state.copyWith(status: NotificationStatus.loading));
      final data = await _repo.fetchNotification();
      emit(
        state.copyWith(notification: data, status: NotificationStatus.idle),
      );
    } on Exception catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}
