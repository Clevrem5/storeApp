part of 'home_bloc.dart';

enum HomeStatus { idle, loading, error }

class HomeState extends Equatable {
  final List<ProductsModel>? products;
  final HomeStatus status;
  final bool? isSuccess;

  const HomeState({
    required this.products,
    required this.status,
    this.isSuccess,

    // required this.selectedId,
  });

  factory HomeState.initial() {
    return HomeState(
      products: [],
      status: HomeStatus.loading,
      isSuccess: null,

      // selectedId: 0,
    );
  }

  HomeState copyWith({
    List<ProductsModel>? product,
    HomeStatus? status,
    bool? isLike,
    // int? select,
  }) {
    return HomeState(
      products: product ?? products,
      status: status ?? this.status,
      isSuccess: isLike ?? isSuccess,

      // selectedId: select ?? selectedId,
    );
  }

  @override
  List<Object?> get props => [
        products,
        status,
        isSuccess,
      ];
}
