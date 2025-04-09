import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/Core/exceptions/custom_exception.dart';
import 'package:store_app/Data/repository/Auth_repository.dart';

part 'reset_event.dart';

part 'reset_state.dart';

class ResetPasswordBloc extends Bloc<ResetEvent, ResetState> {
  final AuthRepository _authRepository;

  ResetPasswordBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(ResetState.initial()) {
    on<SendEmailEvent>(_sendEmail);
    on<SendCodeEmail>(_sendCode);
    on<ResetPasswordEvent>(_saveNewPassword);
  }

  Future<void> _sendEmail(SendEmailEvent event, Emitter<ResetState> emit) async {
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
  }

  Future<void> _sendCode(SendCodeEmail event, Emitter<ResetState> emit) async {
    final result = await _authRepository.postResetEmailCode(event.email, event.code);
    if (result) {
      emit(state.copyWith(status: ResetStatus.success));
    } else {
      throw CustomException(message: "xato ketdi code");
    }
  }

  Future<void> _saveNewPassword(ResetPasswordEvent event, Emitter<ResetState> emit) async {
    final result = await _authRepository.postResetEmailCodeReset(
      event.email,
      event.code,
      event.password,
    );
    if (result) {
      emit(state.copyWith(status: ResetStatus.success));
    } else {
      emit(state.copyWith(status: ResetStatus.error));
    }
  }
}
