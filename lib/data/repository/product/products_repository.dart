import 'package:store_app/Data/client.dart';
import 'package:store_app/data/models/home_models/home_page_model.dart';

class ProductRepository {
  final ApiClient client;

  ProductRepository({required this.client});

  List<ProductsModel> products = [];


  Future<List<ProductsModel>> fetchProducts(
      int? categoryId,
      String? title,
      int? sizeId,
      double? maxPrise,
      double? minPrise,
      String? orderBy,
      ) async {

        final rawProducts = await client.fetchHomeProduct({
          "Title": title,
          "CategoryId": categoryId,
          "SizeID": sizeId,
          "MinPrice": minPrise,
          "MaxPrice": maxPrise,
          "OrderBy": orderBy,
        });
        products = rawProducts.map((e) => ProductsModel.fromJson(e)).toList();
    return products;
  }


}
