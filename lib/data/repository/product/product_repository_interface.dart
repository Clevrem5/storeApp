import 'package:store_app/data/models/home_models/home_page_model.dart';

abstract interface class IProductRepository{
  Future<List<ProductsModel>> fetchProducts(
    int? categoryId,
    String? title,
    int? sizeId,
    double? maxPrise,
    double? minPrise,
    String? orderBy,
  );
}