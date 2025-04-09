import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/Data/repository/Auth_repository.dart';

part 'reset_event.dart';

part 'reset_state.dart';

class ResetPasswordBloc extends Bloc<ResetEvent, ResetState> {
  final AuthRepository _authRepository;

  ResetPasswordBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(ResetState.initial()) {
    on<SendEmailEvent>(
      (event, emit) async {
        final result = await _authRepository.resetPassword(event.email);
        if (result) {
          emit(state.copyWith(status: ResetStatus.success));
        } else {
          emit(
            state.copyWith(
              status: ResetStatus.error,
              message: "password reset qilishda Emailda xato sodir boldi ",
            ),
          );
        }
      },
    );
  }
}
