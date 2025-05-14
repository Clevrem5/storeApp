import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:store_app/Features/search_page/bloc/search_event.dart';
import 'package:store_app/Features/search_page/bloc/search_state.dart';
import 'package:store_app/data/repository/search/search_interface.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ISearchRepository _repo;

  SearchBloc({required ISearchRepository repo})
      : _repo = repo,
        super(SearchState.initial()) {
    // 🔍 Qidiruv Event
    on<SearchLoading>((event, emit) async {
      emit(state.copyWith(status: SearchStatus.loading));

      try {
        final products = await _repo.fetchSearch(event.title);
        final box =Hive.box<String>("searchHistory");

        emit(state.copyWith(
          status: SearchStatus.idle,
          product: products,
          recentTitle: box.values.toList(),
        ));
      } catch (e) {
        emit(state.copyWith(status: SearchStatus.error));
      }
    });

    // 🧹 Tarixni tozalash Event (agar ishlatsangiz)
    on<SearchDeleteItem>((event, emit) async {
      await _repo.deleteSearchItem(event.title);
      final updatedHistory = await _repo.getSearchHistory();
      emit(state.copyWith(recentTitle: updatedHistory)); // Tarixni yangilash
    });

    on<SearchClearHistory>((event, emit) async {
      await _repo.clearHistory();
      emit(state.copyWith(recentTitle: [])); // Tarixni tozalash
    });

  }
}
