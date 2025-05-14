import 'package:hive/hive.dart';
import 'package:store_app/data/models/home_models/home_page_model.dart';

import '../../client.dart';
import 'search_interface.dart';

class SearchRepositoryRemote implements ISearchRepository {
  final ApiClient client;
  final Box<ProductsModel> box = Hive.box<ProductsModel>("search");

  SearchRepositoryRemote({required this.client});

  @override
  Future<List<ProductsModel>> fetchSearch(String? title) async {
    final rawSearch = await client.fetchSearch(title);
    final search = rawSearch.map((e) => ProductsModel.fromJson(e)).toList();

    await box.addAll(search);
    return search;
  }

  @override
  Future<List<String>> getSearchHistory() async => [];

  @override
  Future<void> clearHistory() async {}

  @override
  Future<void> deleteSearchItem(String title) async{}
}
