import 'package:bloc/bloc.dart';
import 'package:store_app/Features/saved_page/manager/saved_event.dart';
import 'package:store_app/Features/saved_page/manager/saved_state.dart';
import '../../../data/repository/product/products_repository.dart';
import '../../../data/repository/saved/saved_repository.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final SavedRepository _repository;

  SavedBloc({required SavedRepository repo})
      : _repository = repo,
        super(
          SavedState.initial(),
        ) {
    on<SavedLoad>(
      (event, emit) async {
        final saved = await _repository.fetchSaved();
        emit(state.copyWith(saved: saved, status: SavedStatus.idle));
      },
    );
    on<SavedLikesEvent>(_unlike);
  }

  Future<void> _unlike(SavedLikesEvent event, Emitter<SavedState> emit) async {
    try {
      final success = await _repository.client.fetchUnSave(event.id);

      final updatedProducts = state.saved.map((p) {
        if (p.id == event.id) return p.copyWith(isLiked: false);
        return p;
      }).toList();

      emit(state.copyWith(
        saved: updatedProducts,
        isSuccess: success,
        status: SavedStatus.idle,
      ));
    } catch (e) {
      emit(state.copyWith(status: SavedStatus.error));
    }
  }
}
