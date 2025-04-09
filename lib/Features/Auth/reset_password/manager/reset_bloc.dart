import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_app/Core/exceptions/custom_exception.dart';
import 'package:store_app/Data/repository/Auth_repository.dart';

part 'reset_event.dart';

part 'reset_state.dart';

class ResetPasswordBloc extends Bloc<ResetEvent, ResetState> {
  final AuthRepository _authRepository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ResetPasswordBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(ResetState.initial()) {
    on<SendEmailEvent>(_sendEmail);
    on<SendCodeEmailEvent>(_sendCode);
    on<ResetPasswordEvent>(_saveNewPassword);
  }

  Future<void> _sendEmail(SendEmailEvent event, Emitter<ResetState> emit) async {
    final result = await _authRepository.resetPassword(
      event.email,
    );
    if (result) {
      emit(state.copyWith(status: ResetStatus.success));
      print(emailController.text);
    } else {
      emit(
        state.copyWith(
          status: ResetStatus.error,
          message: "password reset qilishda Emailda xato sodir boldi ",
        ),
      );
    }
  }

  Future<void> _sendCode(SendCodeEmailEvent event, Emitter<ResetState> emit) async {
    final result = await _authRepository.postResetEmailCode(
      emailController.text.trim(),
      event.code,
    );
    print("nimadir $result");
    if (result) {
      emit(state.copyWith(status: ResetStatus.success));
      print(codeController.text);
    } else {
      throw CustomException(message: "xato ketdi code");
    }
  }

  Future<void> _saveNewPassword(ResetPasswordEvent event, Emitter<ResetState> emit) async {
    final result = await _authRepository.postResetEmailCodeReset(
      emailController.text.trim(),
      codeController.text.trim(),
      event.password,
    );
    if (result) {
      emit(state.copyWith(status: ResetStatus.success));
      print(passwordController.text);
    } else {
      emit(state.copyWith(status: ResetStatus.error));
    }
  }
}
