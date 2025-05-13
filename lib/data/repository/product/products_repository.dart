import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:store_app/data/models/home_models/home_page_model.dart';
import 'package:store_app/data/repository/product/product_repository_interface.dart';
import 'package:store_app/data/repository/product/product_repository_local.dart';
import 'package:store_app/data/repository/product/product_repository_remote.dart';

class ProductRepository implements IProductRepository {
  final ProductRepositoryRemote remoteProduct;
  final ProductsRepositoryLocal localProduct;

  ProductRepository({
    required this.remoteProduct,
    required this.localProduct,
  });

  @override
  Future<List<ProductsModel>> fetchProducts(
    int? categoryId,
    String? title,
    int? sizeId,
    double? maxPrise,
    double? minPrise,
    String? orderBy,
  ) async {
    final isConnect = await Connectivity().checkConnectivity();
    final isOnline = isConnect.contains(
          ConnectivityResult.mobile,
        ) ||
        isConnect.contains(
          ConnectivityResult.wifi,
        );
    if (isOnline) {
      return await remoteProduct.fetchProducts(
        categoryId,
        title,
        sizeId,
        maxPrise,
        minPrise,
        orderBy,
      );
    } else {
      return await localProduct.fetchProducts(
        categoryId,
        title,
        sizeId,
        maxPrise,
        minPrise,
        orderBy,
      );
    }
  }
}
