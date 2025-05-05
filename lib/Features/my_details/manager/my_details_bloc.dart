import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/Features/my_details/manager/my_details_event.dart';
import 'package:store_app/Features/my_details/manager/my_details_state.dart';

import '../../../data/repository/auth/Auth_repository.dart';

class MyDetailsBloc extends Bloc<MyDetailsEvent, MyDetailsState> {
  final AuthRepository _repo;
  final TextEditingController genderContr = TextEditingController();
  final TextEditingController birthContr = TextEditingController();
  final TextEditingController numberContr = TextEditingController();
  final TextEditingController fullNameContr = TextEditingController();
  final TextEditingController emailContr = TextEditingController();

  MyDetailsBloc({required AuthRepository repo})
      : _repo = repo,
        super(
          MyDetailsState(status: MyDetailsStatus.loading),
        ) {
    on<MyDetailsLoad>(_load);
  }

  Future<void> _load(MyDetailsLoad event, Emitter<MyDetailsState> emit) async {
    final info = await _repo.updateUser(
      gender: genderContr.text.trim(),
      fullName: fullNameContr.text.trim(),
      birthdate: birthContr.text.trim(),
      phoneNumber: numberContr.text.trim(),
      email: emailContr.text.trim(),
    );

    if (info) {
      print (emailContr.text);
      print (genderContr.text);
      print (fullNameContr.text);
      print (numberContr.text);
      print (birthContr.text);
      emit(state.copyWith(status: MyDetailsStatus.submitted));
    } else {
      emit(state.copyWith(status: MyDetailsStatus.error));
    }
  }
}