import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_app/Data/repository/sign_up_repository.dart';
import 'package:store_app/Features/Auth/sign_up/manager/sign_up_event.dart';
import 'package:store_app/Features/Auth/sign_up/manager/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository _repo;
  // final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignUpBloc({required AuthRepository repo})
      : _repo = repo,
        super(SignUpState.initial()) {
    on<SignUpLoad>(_load);
    add(SignUpLoad());
  }

  Future<void> _load(SignUpLoad event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(status: SignUpStatus.loading));
    final store = await _repo.signUp(
      fullName: fullNameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    if (store) {
      emit(state.copyWith(status: SignUpStatus.submitted));
    }  else {
      emit(state.copyWith(status: SignUpStatus.error));
    }
  }
}

//   Future<bool> signUp() async {
//     final result = await _repo.signUp(
//       firstName: firstNameContr.text.trim(),
//       lastName: lastNameContr.text.trim(),
//       userName: userNameContr.text.trim(),
//       email: emailContr.text.trim(),
//       phoneNumber: phoneNumberContr.text.trim(),
//       dateOfBirth: selectedData ?? DateTime.now(),
//       password: passwordContr.text.trim(),
//     );
//     print("malumot ketdi ${result}");
//     return result;
//   }
// }
