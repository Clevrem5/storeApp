import 'package:store_app/Data/client.dart';
import '../../models/home_models/category_model.dart';

class CategoriesRepository {
  final ApiClient client;

  CategoriesRepository({required this.client});

  List<CategoriesModel> categories = [];

  Future<List<CategoriesModel>> fetchCategories() async {
    var rawProducts = await client.fetchCategories();
    categories = rawProducts.map((e) => CategoriesModel.fromJson(e)).toList();
    return categories;
  }
}
