import '../../client.dart';
import '../../models/home_models/home_page_model.dart';

class SavedRepository{
  final ApiClient client;

  SavedRepository({required this.client});

  List<ProductsModel> saved = [];


  Future<List<ProductsModel>> fetchSaved() async {
    var rawProducts = await client.fetchSaveLiked();
    saved = rawProducts.map((e) => ProductsModel.fromJson(e)).toList();
    return saved;
  }

}