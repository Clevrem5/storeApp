import 'package:equatable/equatable.dart';

enum ResetEmailStatus { loading, success, error }

class ResetEmailState extends Equatable {
  final ResetEmailStatus status;
  final String? message;

  const ResetEmailState({
    required this.status,
    required this.message,
  });

  ResetEmailState copyWith({
    ResetEmailStatus? status,
    String? message,
  }) {
    return ResetEmailState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  factory ResetEmailState.initial() {
    return ResetEmailState(message: null, status: ResetEmailStatus.loading);
  }

  @override
  List<Object?> get props => [status, message];
}

enum ResetCodeStatus { loading, success, error }

class ResetCodeState extends Equatable {
  final ResetCodeStatus status;
  final String? code;
  final String? email;

  const ResetCodeState({
    required this.status,
    required this.code,
    required this.email,
  });

  ResetCodeState copyWith({
    ResetCodeStatus? status,
    String? code,
    String? email,
  }) {
    return ResetCodeState(
      status: status ?? this.status,
      code: code ?? this.code,
      email: email ?? this.email,
    );
  }

  factory ResetCodeState.initial() {
    return ResetCodeState(status: ResetCodeStatus.loading, code: null, email: null);
  }

  @override
  List<Object?> get props => [code, status, email];
}

enum ResetNewPasswordStatus { loading, error, success }

class ResetNewPasswordState extends Equatable {
  final ResetNewPasswordStatus? status;
  final String? code;
  final String? email;
  final String? password;

  const ResetNewPasswordState({
    required this.email,
    required this.status,
    required this.code,
    required this.password,
  });

  ResetNewPasswordState copyWith({
    ResetNewPasswordStatus? status,
    String? email,
    String? code,
    String? password,
  }) {
    return ResetNewPasswordState(
      email: email ?? this.email,
      status: status ?? this.status,
      code: code ?? this.code,
      password: password ?? this.password,
    );
  }

  factory ResetNewPasswordState.initial() {
    return ResetNewPasswordState(email: null, status: ResetNewPasswordStatus.loading, code: null, password: null);
  }

  @override
  List<Object?> get props => [status, email, code, password ];
}
