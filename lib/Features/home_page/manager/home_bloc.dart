import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/data/models/home_page_model.dart';
import 'package:store_app/data/repository/products_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository _repository;

  HomeBloc({required ProductRepository repo})
      : _repository = repo,
        super(HomeState.initial()) {
    on<HomeLoad>(_load);
    add(HomeLoad());
  }

  Future<void> _load(HomeLoad event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final product = await _repository.fetchProducts(null);
      emit(
        state.copyWith(
          product: product,
          status: HomeStatus.idle,
          // select: event.selectedId,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: HomeStatus.error),
      );
    }
  }
}
