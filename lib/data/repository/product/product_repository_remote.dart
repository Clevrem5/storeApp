import 'package:hive/hive.dart';
import 'package:store_app/data/models/home_models/home_page_model.dart';
import 'package:store_app/data/repository/product/product_repository_interface.dart';

import '../../client.dart';

class ProductRepositoryRemote implements IProductRepository {
  final ApiClient client;

  ProductRepositoryRemote({required this.client});

  List<ProductsModel> products = [];

  @override
  Future<List<ProductsModel>> fetchProducts(
    int? categoryId,
    String? title,
    int? sizeId,
    double? maxPrise,
    double? minPrise,
    String? orderBy,
  ) async {
    final Box<ProductsModel> box = Hive.box("products");
    final rawProducts = await client.fetchHomeProduct({
      "Title": title,
      "CategoryId": categoryId,
      "SizeID": sizeId,
      "MinPrice": minPrise,
      "MaxPrice": maxPrise,
      "OrderBy": orderBy,
    });
    products = rawProducts
        .map(
          (e) => ProductsModel.fromJson(e),
        )
        .toList();

    await box.clear();
    await box.addAll(products);

    return products;
  }
}
