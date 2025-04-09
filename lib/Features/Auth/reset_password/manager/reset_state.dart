part of 'reset_bloc.dart';




enum ResetStatus { loading, success, error }

class ResetState extends Equatable {
  final ResetStatus status;
  final String? message;

  const ResetState({
    required this.status,
    required this.message,
  });

  ResetState copyWith({
    ResetStatus? status,
    String? message,
  }) {
    return ResetState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  factory ResetState.initial() {
    return ResetState(message: null, status: ResetStatus.loading);
  }

  @override
  List<Object?> get props => [status, message];
}
 

