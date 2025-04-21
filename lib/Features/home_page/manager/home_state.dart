part of 'home_bloc.dart';

enum HomeStatus { idle, loading, error, }

class HomeState extends Equatable {
  final List<ProductsModel>? products;
  final List<ProductsModel>? saved;
  final List<CategoriesModel>? categories;
  final List<SizesModel>? sizes;
  final HomeStatus status;
  final bool? isSuccess;

  const HomeState({
    required this.products,
    required this.saved,
    required this.status,
    required this.categories,
    required this.sizes,
    this.isSuccess,

    // required this.selectedId,
  });

  factory HomeState.initial() {
    return HomeState(
      products: [],
      saved: [],
      categories: [],
      sizes: [],
      status: HomeStatus.loading,
      isSuccess: null,
      // selectedId: 0,
    );
  }

  HomeState copyWith({
    List<ProductsModel>? product,
    List<ProductsModel>? saved,
    List<CategoriesModel>? categories,
    List<SizesModel>? sizes,
    HomeStatus? status,
    bool? isLike,
    // int? select,
  }) {
    return HomeState(
      products: product ?? products,
      status: status ?? this.status,
      isSuccess: isLike ?? isSuccess,
      saved: saved ?? this.saved,
      categories: categories ?? this.categories,
      sizes: sizes ?? this.sizes
      // selectedId: select ?? selectedId,
    );
  }

  @override
  List<Object?> get props => [products, status, isSuccess, saved, categories, sizes];
}
