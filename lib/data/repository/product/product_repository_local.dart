import 'package:hive/hive.dart';
import 'package:store_app/data/models/home_models/home_page_model.dart';
import 'package:store_app/data/repository/product/product_repository_interface.dart';

class ProductsRepositoryLocal implements IProductRepository {
  //birinchi boxni ochib olamiz va keyin uni methondi ichidan ishlatamiz!!!
  final Box<ProductsModel> box = Hive.box<ProductsModel>('products');

// bu yerda interface ichidagi talab qilingan funksiyani ishlatamiz override qilib yuboramiz yani ustiga yozib yuboramiz xar xil amallar ishlatib!!!
  @override
  Future<List<ProductsModel>> fetchProducts(
    int? categoryId,
    String? title,
    int? sizeId,
    double? maxPrise,
    double? minPrise,
    String? orderBy,
  ) async {
    final products = box.values.toList();
    return products;
  }
}
