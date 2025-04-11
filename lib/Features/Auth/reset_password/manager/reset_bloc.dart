import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_app/Core/secure_storage.dart';
import 'package:store_app/Data/repository/Auth_repository.dart';

import '../../../../Core/exceptions/custom_exception.dart';

part 'reset_event.dart';
part 'reset_state.dart';

class ResetEmailBloc extends Bloc<ResetEmailEvent, ResetState> {
  final AuthRepository _authRepository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ResetEmailBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(ResetState.initial()) {
    on<SendEmailEvent>(_sendEmail);
    on<SendCodeEmailEvent>(_sendCode);
    on<ResetPasswordEvent>(_saveNewPassword);
  }

  Future<void> _sendEmail(SendEmailEvent event, Emitter<ResetState> emit) async {
    final result = await _authRepository.postResetEmail(
      event.email,
    );
    if (result) {
      emit(state.copyWith(status: ResetStatus.success));
      await SecureStorage.saveEmail(event.email);
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
      SecureStorage.getEmail() as String,
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
