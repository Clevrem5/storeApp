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
    // add(HomeLoad());
    on<LikeSaveEvent>(_like);
    on<LikeUnSaveEvent>(_unlike);
    on<SaveLoadEvent>(_save);
  }

  Future<void> _load(HomeLoad event, Emitter<HomeState> emit) async {
    try {
      final product = await _repository.fetchProducts(
        event.categoryId,
        event.title,
        event.sizeId,
        event.maxPrice,
        event.minPrice,
        event.orderBy,
      );
      emit(
        state.copyWith(
          product: product,
          status: HomeStatus.idle,
          // select: event.selectedId,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.error,
        ),
      );
    }
  }

  Future<void> _like(LikeSaveEvent event, Emitter<HomeState> emit) async {
    try {
      final success = await _repository.client.fetchSaveLike(event.likeId);

      final updatedProducts = state.products!.map((p) {
        if (p.id == event.likeId) return p.copyWith(isLiked: true);
        return p;
      }).toList();

      emit(state.copyWith(
        product: updatedProducts,
        isLike: success,
        status: HomeStatus.idle,
      ));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  Future<void> _unlike(LikeUnSaveEvent event, Emitter<HomeState> emit) async {
    try {
      final success = await _repository.client.fetchUnSave(event.unLikeId);

      final updatedProducts = state.products!.map((p) {
        if (p.id == event.unLikeId) return p.copyWith(isLiked: false);
        return p;
      }).toList();

      emit(state.copyWith(
        product: updatedProducts,
        isLike: success,
        status: HomeStatus.idle,
      ));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  Future<void> _save(SaveLoadEvent event, Emitter<HomeState> emit) async {
    final saved = await _repository.fetchSaved();
    emit(state.copyWith(saved: saved, status: HomeStatus.idle));
  }
}
