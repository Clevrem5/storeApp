// 🔹 Combined Repository
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:store_app/data/models/home_models/home_page_model.dart';
import 'search_interface.dart';
import 'search_repository_local.dart';
import 'search_repository_remote.dart';

class SearchRepository implements ISearchRepository {
  final SearchRepositoryLocal local;
  final SearchRepositoryRemote remote;

  SearchRepository({required this.local, required this.remote});

  @override
  Future<List<ProductsModel>> fetchSearch(String? title) async {
    final isConnect = await Connectivity().checkConnectivity();
    final isOnline = isConnect.contains(ConnectivityResult.mobile) ||
        isConnect.contains(ConnectivityResult.wifi);

    if (isOnline) {
      return await remote.fetchSearch(title);
    } else {
      return await local.fetchSearch(title);
    }
  }

  @override
  Future<List<String>> getSearchHistory() async {
    return await local.getSearchHistory();
  }

  @override
  Future<void> clearHistory() async {
    await local.clearHistory();
  }
  @override
  Future<void> deleteSearchItem(String title)async{
    await local.deleteSearchItem(title);
  }
}
