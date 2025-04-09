import 'package:store_app/Data/client.dart';
import 'package:store_app/Data/models/home_page_model.dart';

class ProductsRepository {
  ProductsRepository({required this.client});

  final ApiClient client;
  List<ProductsModel>? categories;
  Future<List<ProductsModel>> fetchHomePage(int categoryId, String? searchTitle) async {
    final rawProducts = await client.fetchHomePage(categoryId, searchTitle);
    categories = rawProducts.map((category) => ProductsModel.fromJson(category)).toList();
    return categories!;
  }
}