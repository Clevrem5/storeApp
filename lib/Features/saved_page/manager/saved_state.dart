import 'package:equatable/equatable.dart';
import 'package:store_app/data/models/home_page_model.dart';

enum SavedStatus { idle, error, loading }

class SavedState extends Equatable {
  final List<ProductsModel> saved;
  final SavedStatus? status;

  const SavedState({
    required this.status,
    required this.saved,
  });

  factory SavedState.initial() {
    return SavedState(status: SavedStatus.loading, saved: []);
  }

  SavedState copyWith({List<ProductsModel>? saved, SavedStatus? status}) {
    return SavedState(
      status: status ?? this.status,
      saved: saved ?? this.saved,
    );
  }

  @override
  List<Object?> get props => [status,saved];
}
