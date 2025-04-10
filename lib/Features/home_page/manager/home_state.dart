part of 'home_bloc.dart';

enum HomeStatus { idle, loading, error }

class HomeState extends Equatable {
  final List<ProductsModel>? products;
  final HomeStatus status;

  const HomeState({
    required this.products,
    required this.status,
  });

  factory HomeState.initial() {
    return HomeState(
      products: [],
      status: HomeStatus.loading,
    );
  }

  HomeState copyWith({
    List<ProductsModel>? product,
    HomeStatus? status,
  }) {
    return HomeState(
      products: product ?? products,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [products, status];
}
