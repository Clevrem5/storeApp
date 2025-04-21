import 'package:equatable/equatable.dart';
import 'package:store_app/data/models/detaisl_model.dart';

enum DetailsStatus { idle, error, loading }

class DetailsState extends Equatable {
  final DetailsStatus status;
  final DetailsModel? details;

  const DetailsState({
    required this.details,
    required this.status,
  });

  factory DetailsState.initial() {
    return DetailsState(
      details: null,
      status: DetailsStatus.loading,
    );
  }

  DetailsState copyWith({
    DetailsModel? details,
    DetailsStatus? status,
  }) {
    return DetailsState(
      details: details ?? this.details,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        details,
        status,
      ];
}
