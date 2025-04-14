import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Core/secure_storage.dart';
import '../../../../Data/repository/Auth_repository.dart';

part 'reset_event.dart';
part 'reset_state.dart';

class ResetPasswordBloc extends Bloc<ResetEvent, ResetState> {
  final AuthRepository _authRepository;

  ResetPasswordBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(ResetState.initial()) {
    // 1. Email yuborish bosqichi
    on<SendEmailEvent>(
          (event, emit) async {
        final result = await _authRepository.postResetEmail(event.email);
        await SecureStorage.saveEmail(event.email);

        if (result) {
          emit(state.copyWith(status: ResetStatus.success));
        } else {
          emit(state.copyWith(
            status: ResetStatus.error,
            message: "Password reset qilishda emailda xato yuz berdi",
          ));
        }
      },
    );

    // 2. Kodni tekshirish bosqichi
    on<SendCodeEmail>(
          (event, emit) async {
        emit(state.copyWith(status: ResetStatus.loading));
        final email = await SecureStorage.getEmail();

        final result = await _authRepository.postResetEmailCode(
          email["email"]!,
          event.code,
        );

        await SecureStorage.saveCode(event.code);

        if (result) {
          emit(state.copyWith(status: ResetStatus.success));
        } else {
          emit(state.copyWith(
            status: ResetStatus.error,
            message: "Kodni tekshirishda xatolik yuz berdi.",
          ));
        }
      },
    );

    // 3. Yangi parolni saqlash bosqichi
    on<ResetPasswordEvent>(
          (event, emit) async {
        emit(state.copyWith(status: ResetStatus.loading));

        final code = await SecureStorage.getCode();
        final email = await SecureStorage.getEmail();

        final result = await _authRepository.postResetEmailCodeReset(
          email["email"]!,
          code["code"]!,
          event.password,
        );

        if (result) {
          emit(state.copyWith(status: ResetStatus.success));
        } else {
          emit(state.copyWith(
            status: ResetStatus.error,
            message: "Parolni tiklashda xatolik yuz berdi.",
          ));
        }
      },
    );
  }
}
