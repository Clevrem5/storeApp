import 'package:equatable/equatable.dart';
import 'package:store_app/data/models/home_models/home_page_model.dart';

enum SearchStatus { initial, idle, loading, error }

class SearchState extends Equatable {
  final List<ProductsModel> product;
  final List<String> recently;
  final SearchStatus status;

  const SearchState({
    required this.product,
    required this.status,
    required this.recently,
  });

  factory SearchState.initial() {
    return SearchState(
      product: [],
      status: SearchStatus.loading,
      recently: [],
    );
  }

  SearchState copyWith({
    List<ProductsModel>? product,
    List<String>? recentTitle,
    SearchStatus? status,
  }) {
    return SearchState(
      product: product ?? this.product,
      status: status ?? this.status,
      recently: recentTitle ?? recently,
    );
  }

  @override
  List<Object?> get props => [
        status,
        product,
        recently,
      ];
}
