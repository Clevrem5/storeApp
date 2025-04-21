import 'package:equatable/equatable.dart';
import 'package:store_app/data/models/home_page_model.dart';

enum SavedStatus { idle, error, loading }

class SavedState extends Equatable {
  final List<ProductsModel> saved;
  final SavedStatus? status;
  final bool? isSuccess;

  const SavedState({
    required this.status,
    required this.saved,
    this.isSuccess,
  });

  factory SavedState.initial() {
    return SavedState(
      status: SavedStatus.loading,
      saved: [],
      isSuccess: null,
    );
  }

  SavedState copyWith({
    List<ProductsModel>? saved,
    SavedStatus? status,
    bool? success,
  }) {
    return SavedState(
      status: status ?? this.status,
      saved: saved ?? this.saved,
      isSuccess: success ?? isSuccess,
    );
  }

  @override
  List<Object?> get props => [status, saved, isSuccess];
}
