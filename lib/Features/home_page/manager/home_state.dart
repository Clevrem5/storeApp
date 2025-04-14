part of 'home_bloc.dart';

enum HomeStatus { idle, loading, error }

class HomeState extends Equatable {
  final List<ProductsModel>? products;
  final HomeStatus status;
  final int selectedId;

  const HomeState({
    required this.products,
    required this.status,
    required this.selectedId,
  });

  factory HomeState.initial() {
    return HomeState(
      products: [],
      status: HomeStatus.loading,
      selectedId: 0,
    );
  }

  HomeState copyWith({
    List<ProductsModel>? product,
    HomeStatus? status,
    int? select,
  }) {
    return HomeState(
      products: product ?? products,
      status: status ?? this.status,
      selectedId: select ?? selectedId,
    );
  }

  @override
  List<Object?> get props => [products, status,selectedId];
}
