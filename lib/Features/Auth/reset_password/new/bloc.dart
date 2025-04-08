import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_app/Data/repository/Auth_repository.dart';
import 'package:store_app/Features/Auth/reset_password/new/event.dart';
import 'package:store_app/Features/Auth/reset_password/new/state.dart';

// class ResetEmailBloc extends Bloc<ResetEmailEvent, ResetEmailState> {
//   final AuthRepository _emailRepo;
//   final emailController = TextEditingController();
//
//   ResetEmailBloc({required AuthRepository emailRepo}) : _emailRepo = emailRepo, super(ResetEmailState.initial()) {
//     on<ResetEmail>
//   }
// }