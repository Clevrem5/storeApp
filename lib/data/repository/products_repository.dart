import 'package:store_app/Data/client.dart';
import 'package:store_app/data/models/home_page_model.dart';

class ProductRepository {
  final ApiClient client;

  ProductRepository({required this.client});

  List<ProductsModel> products = [];
  List<ProductsModel> saved = [];
  List<CategoriesModel> categories = [];



  Future<List<ProductsModel>> fetchProducts(int? categoryId ,String? title) async {
    var rawProducts = await client.fetchHomeProduct(0);

    products = rawProducts.map((e) => ProductsModel.fromJson(e)).toList();
    return products;
  }
  Future<List<CategoriesModel>> fetchCategories() async {
    var rawProducts = await client.fetchCategories();
    categories = rawProducts.map((e) => CategoriesModel.fromJson(e)).toList();
    return categories;
  }
  Future<List<ProductsModel>> fetchSaved() async {
    var rawProducts = await client.fetchSaveLiked();
    products = rawProducts.map((e) => ProductsModel.fromJson(e)).toList();
    return products;
  }

}
