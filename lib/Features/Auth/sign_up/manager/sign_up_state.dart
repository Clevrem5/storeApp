import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_app/Data/models/Auth_model.dart';

enum SignUpStatus { idle, loading, error, submitted}

class SignUpState extends Equatable {
  // final formKey = GlobalKey<FormState>();
  // final fullNameController = TextEditingController();
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  // final AuthModel? authModel;
  final SignUpStatus? status;

  const SignUpState({required this.status});

  factory SignUpState.initial() {
    return SignUpState(status: SignUpStatus.loading);
  }

  SignUpState copyWith({
    SignUpStatus? status,
    // AuthModel? authModel,
  }) {
    return SignUpState(
      status: status ?? this.status,
      // authModel: authModel ?? this.authModel
    );
  }
  @override
  List<Object?> get props => [status];
}

// class SignUpViewModel extends ChangeNotifier {
//   SignUpViewModel({required AuthRepository repo}) : _repo = repo;
//
//   final AuthRepository _repo;
//   final formKey = GlobalKey<FormState>();
//   final firstNameContr = TextEditingController();
//   final lastNameContr = TextEditingController();
//   final userNameContr = TextEditingController();
//   final emailContr = TextEditingController();
//   final phoneNumberContr = TextEditingController();
//   final passwordContr = TextEditingController();
//   final confirmPasswordContr = TextEditingController();
//   DateTime? _selectedData;
//
//   DateTime? get selectedData => _selectedData;
//
//   set selectedData(DateTime? value) {
//     _selectedData = value ?? _selectedData;
//     notifyListeners();
//   }
//
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
