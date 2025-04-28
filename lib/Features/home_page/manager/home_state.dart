import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/home_models/category_model.dart';
import '../../../data/models/home_models/home_page_model.dart';
import '../../../data/models/home_models/size_model.dart';

part 'home_state.freezed.dart';

enum HomeStatus { idle, loading, error }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required List<ProductsModel> product,
    required List<ProductsModel> saved,
    required List<CategoriesModel> categories,
    required List<SizesModel> sizes,
    required HomeStatus status,
    required bool? isSuccess,
  }) = _HomeState;

  factory HomeState.initial() {
    return const HomeState(
      product: [],
      saved: [],
      categories: [],
      sizes: [],
      status: HomeStatus.loading,
      isSuccess: null,
    );
  }
}

// HomeState copyWith({
//   List<ProductsModel>? product,
//   List<ProductsModel>? saved,
//   List<CategoriesModel>? categories,
//   List<SizesModel>? sizes,
//   HomeStatus? status,
//   bool? isLike,
//   // int? select,
// }) {
//   return HomeState(
//     products: product ?? products,
//     status: status ?? this.status,
//     isSuccess: isLike ?? isSuccess,
//     saved: saved ?? this.saved,
//     categories: categories ?? this.categories,
//     sizes: sizes ?? this.sizes
//     // selectedId: select ?? selectedId,
//   );
// }
//
// @override
// List<Object?> get props => [products, status, isSuccess, saved, categories, sizes];

