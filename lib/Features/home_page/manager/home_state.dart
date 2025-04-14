part of 'home_bloc.dart';

enum HomeStatus { idle, loading, error }

class HomeState extends Equatable {
  final List<ProductsModel>? products;
  final HomeStatus status;
  final int likedId;
  final int unlikedId;

  const HomeState({
    required this.products,
    required this.status,
    required this.likedId,
    required this.unlikedId,
    // required this.selectedId,
  });

  factory HomeState.initial() {
    return HomeState(
      products: [],
      status: HomeStatus.loading,
      likedId: 0,
      unlikedId: 0,
      // selectedId: 0,
    );
  }

  HomeState copyWith({
    List<ProductsModel>? product,
    HomeStatus? status,
    int? like,
    int? unlike,
    // int? select,
  }) {
    return HomeState(
      products: product ?? products,
      status: status ?? this.status,
      likedId: like ?? likedId,
      unlikedId: unlike ?? unlikedId,
      // selectedId: select ?? selectedId,
    );
  }

  @override
  List<Object?> get props => [
        products,
        status,
        likedId,
        unlikedId,
      ];
}
