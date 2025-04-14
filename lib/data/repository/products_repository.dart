import 'package:store_app/Data/client.dart';
import 'package:store_app/data/models/home_page_model.dart';

class ProductRepository {
  final ApiClient client;

  ProductRepository({required this.client});

  List<ProductsModel> products = [];

  Future<List<ProductsModel>> fetchProducts(int? categoryId ) async {
    var rawProducts = await client.fetchHomeProduct();
    products = rawProducts.map((e) => ProductsModel.fromJson(e)).toList();
    return products;
  }
}
