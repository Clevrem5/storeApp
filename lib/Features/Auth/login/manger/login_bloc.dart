import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_app/Data/repository/Auth_repository.dart';
import 'package:store_app/Features/Auth/login/manger/login_event.dart';
import 'package:store_app/Features/Auth/login/manger/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _repo;
  final TextEditingController loginContr = TextEditingController();
  final TextEditingController passwordContr = TextEditingController();

  LoginBloc({required AuthRepository repo})
      : _repo = repo,
        super(LoginState.initial()) {
    on<LoginLoad>(_load);
    // add(LoginLoad());
  }

  Future<void> _load(LoginLoad event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));

    final store = await _repo.login(
      loginContr.text,
      passwordContr.text,
    );

    if (store) {
      emit(state.copyWith(status: LoginStatus.success));
    } else {
      emit(state.copyWith(status: LoginStatus.error));
    }
  }

}

// class AuthViewModel extends ChangeNotifier{
//   final AuthRepository _repo;
//   AuthViewModel({required AuthRepository repo}): _repo=repo;
//
//   final formKey=GlobalKey<FormState>();
//   final TextEditingController loginContr=TextEditingController();
//   final TextEditingController passwordContr=TextEditingController();
//
//   bool _isAuth=false;
//   bool get isAuth=>_isAuth;
//
//   Future<bool>submitForm()async{
//     if (formKey.currentState!.validate()){
//       String login= loginContr.text;
//       String password= passwordContr.text;
//
//       _isAuth=await _repo.login(login, password);
//       notifyListeners();
//     }
//     return _isAuth;
//   }
//
//   Future<void> obtainToken(String login,String password)async{
//     _isAuth=await _repo.login(login, password);
//     notifyListeners();
//   }
//
//   Future<void>logOut()async{
//     await _repo.logout();
//     _isAuth=false;
//     notifyListeners();
//   }
//
// }
