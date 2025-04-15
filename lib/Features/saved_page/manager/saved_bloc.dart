import 'package:bloc/bloc.dart';
import 'package:store_app/Features/saved_page/manager/saved_event.dart';
import 'package:store_app/Features/saved_page/manager/saved_state.dart';
import 'package:store_app/data/repository/products_repository.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final ProductRepository _repository;

  SavedBloc({required ProductRepository repo})
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
  }
}
