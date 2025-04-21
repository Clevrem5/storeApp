import 'package:store_app/Data/client.dart';
import 'package:store_app/data/models/detaisl_model.dart';
import 'package:store_app/data/models/home_page_model.dart';

class ProductRepository {
  final ApiClient client;

  ProductRepository({required this.client});

  List<ProductsModel> products = [];
  List<ProductsModel> saved = [];
  List<CategoriesModel> categories = [];
  List<SizesModel> sizes = [];
  DetailsModel? details;

  Future<List<ProductsModel>> fetchProducts(
    int? categoryId,
    String? title,
    int? sizeId,
    double? maxPrise,
    double? minPrise,
    String? orderBy,
  ) async {
    var rawProducts = await client.fetchHomeProduct({
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

  Future<List<CategoriesModel>> fetchCategories() async {
    var rawProducts = await client.fetchCategories();
    categories = rawProducts.map((e) => CategoriesModel.fromJson(e)).toList();
    return categories;
  }

  Future<List<SizesModel>> fetchSizes() async {
    var rawProducts = await client.fetchSizes();
    sizes = rawProducts.map((e) => SizesModel.fromJson(e)).toList();
    return sizes;
  }

  Future<List<ProductsModel>> fetchSaved() async {
    var rawProducts = await client.fetchSaveLiked();
    products = rawProducts.map((e) => ProductsModel.fromJson(e)).toList();
    return products;
  }

  Future<DetailsModel> fetchDetails(int id) async {
    final rawDetails=await client.fetchDetails(id);
    details = DetailsModel.fromJson(rawDetails);
    print("1111111111111    $details");
    return details!;
  }
}
