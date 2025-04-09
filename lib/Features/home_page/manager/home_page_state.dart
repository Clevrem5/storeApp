import 'package:equatable/equatable.dart';
import 'package:store_app/Data/models/home_page_model.dart';

enum HomePageStatus { loading, error, initial, idle }

class HomePageState extends Equatable {
  final HomePageStatus? status;
  final List<ProductsModel>? store;

  const HomePageState({
    required this.status,
    required this.store,
  });

  factory HomePageState.initial() {
    return HomePageState(
      status: HomePageStatus.loading,
      store: [],
    );
  }

  HomePageState copyWith({
    HomePageStatus? status,
    List<ProductsModel>? store,
  }) {
    return HomePageState(
      status: status ?? this.status,
      store: store ?? this.store,
    );
  }

  @override
  List<Object?> get props => [store, status];
}
