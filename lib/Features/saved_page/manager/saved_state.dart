import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/models/home_models/home_page_model.dart';

part 'saved_state.freezed.dart';
enum SavedStatus { idle, error, loading }
@freezed
 abstract class SavedState with _$SavedState {
  // final List<ProductsModel> saved;
  // final SavedStatus? status;
  // final bool? isSuccess;

 const factory  SavedState({
    required SavedStatus status,
    required List<ProductsModel> saved,
   required bool? isSuccess,
  })=_SavedState;

  factory SavedState.initial() {
    return SavedState(
      status: SavedStatus.loading,
      saved: [],
      isSuccess: null,
    );
  }

  // SavedState copyWith({
  //   List<ProductsModel>? saved,
  //   SavedStatus? status,
  //   bool? success,
  // }) {
  //   return SavedState(
  //     status: status ?? this.status,
  //     saved: saved ?? this.saved,
  //     isSuccess: success ?? isSuccess,
  //   );
  // }
  //
  // @override
  // List<Object?> get props => [status, saved, isSuccess];
}
