import 'package:equatable/equatable.dart';

enum MyDetailsStatus { idle, loading, submitted, error }

class MyDetailsState extends Equatable {
  final MyDetailsStatus status;

  const MyDetailsState({required this.status});

  MyDetailsState copyWith({MyDetailsStatus? status}) {
    return MyDetailsState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}
