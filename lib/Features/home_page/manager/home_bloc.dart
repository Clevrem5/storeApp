import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/data/repository/categories/categories_repository.dart';
import 'package:store_app/data/repository/saved/saved_repository.dart';
import 'package:store_app/data/repository/sizes/sizes_repository.dart';

import '../../../data/models/home_models/category_model.dart';
import '../../../data/models/home_models/home_page_model.dart';
import '../../../data/models/home_models/size_model.dart';
import '../../../data/repository/product/product_repository_interface.dart';
import '../../../data/repository/product/products_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IProductRepository _repository;
  final CategoriesRepository _categoriesRepository;
  final SizesRepository _sizesRepository;
  final SavedRepository _savedRepository;

  HomeBloc({
    required IProductRepository repo,
    required CategoriesRepository categoriesRepo,
    required SizesRepository sizesRepo,
    required SavedRepository savedRepo,
  })  : _repository = repo,
  _sizesRepository=sizesRepo,
  _categoriesRepository=categoriesRepo,
  _savedRepository=savedRepo,
        super(HomeState.initial()) {
    on<HomeLoad>(_load);
    // add(HomeLoad());
    on<LikeSaveEvent>(_like);
    on<LikeUnSaveEvent>(_unlike);
    on<SaveLoadEvent>(_save);
    on<CategoriesLoadEvent>(_categories);
    on<SizesLoadEvent>(_sizes);
  }

  Future<void> _load(HomeLoad event, Emitter<HomeState> emit) async {
    try {
      final product = await _repository.fetchProducts(
        // event.categoryId,
        // event.title,
        // event.sizeId,
        // event.maxPrice,
        // event.minPrice,
        // event.orderBy,
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
      final success = await _savedRepository.client.fetchSaveLike(event.likeId);

      final updatedProducts = state.product.map((p) {
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
      final success = await _savedRepository.client.fetchUnSave(event.unLikeId);

      final updatedProducts = state.product.map((p) {
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
    final saved = await _savedRepository.fetchSaved();
    emit(state.copyWith(saved: saved, status: HomeStatus.idle));
  }
  Future<void> _categories(CategoriesLoadEvent event, Emitter<HomeState> emit) async {
    final categories = await _categoriesRepository.fetchCategories();
    emit(state.copyWith(categories: categories, status: HomeStatus.idle));
  }
  Future<void> _sizes(SizesLoadEvent event, Emitter<HomeState> emit) async {
    final sizes = await _sizesRepository.fetchSizes();
    emit(state.copyWith(sizes: sizes, status: HomeStatus.idle));
  }
}
