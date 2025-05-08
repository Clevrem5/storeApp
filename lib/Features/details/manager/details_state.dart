import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/models/details%20model/details_model.dart';

part 'details_state.freezed.dart';

enum DetailsStatus { idle, error, loading }

@freezed
abstract class DetailsState with _$DetailsState {
  const factory DetailsState({
    required DetailsStatus status,
    required DetailsModel? details,
  }) = _DetailsState;

  factory DetailsState.initial() {
    return  DetailsState(
      status: DetailsStatus.loading,
      details: null,
    );
  }
}

// factory DetailsState.initial() {
  //   return DetailsState(
  //     details: null,
  //     status: DetailsStatus.loading,
  //   );
  // }
  //
  // DetailsState copyWith({
  //   DetailsModel? details,
  //   DetailsStatus? status,
  // }) {
  //   return DetailsState(
  //     details: details ?? this.details,
  //     status: status ?? this.status,
  //   );
  // }
  //
  // @override
  // List<Object?> get props => [
  //       details,
  //       status,
  //     ];

