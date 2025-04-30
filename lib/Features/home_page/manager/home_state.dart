
part of 'home_bloc.dart';



enum HomeStatus { idle, loading, error }

class HomeState extends Equatable {
  final List<ProductsModel>product;
  final List<ProductsModel>saved;
  final List<CategoriesModel>categories;
  final List<SizesModel>sizes;
  final HomeStatus status;
  final bool? isSuccess;

  const HomeState({
    required this.product,
    required this.saved,
    required this.categories,
    required this.sizes,
    required this.status,
    required this.isSuccess,
  });

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
        product: product ?? this.product,
        status: status ?? this.status,
        isSuccess: isLike ?? isSuccess,
        saved: saved ?? this.saved,
        categories: categories ?? this.categories,
        sizes: sizes ?? this.sizes
      // selectedId: select ?? selectedId,
    );
}

  @override
  List<Object?> get props => [product, status, isSuccess, saved, categories, sizes];

}


