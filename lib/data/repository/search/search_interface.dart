import 'package:store_app/data/models/home_models/home_page_model.dart';

abstract interface class ISearchRepository {
  Future<List<ProductsModel>> fetchSearch(String? title);
  Future<List<String>> getSearchHistory();
  Future<void> clearHistory();
  Future<void> deleteSearchItem(String title);
}