import '../../client.dart';
import '../../models/home_models/size_model.dart';

class SizesRepository{
  final ApiClient client;
  SizesRepository({required this.client});

  List<SizesModel> sizes = [];

  Future<List<SizesModel>> fetchSizes() async {
    var rawProducts = await client.fetchSizes();
    sizes = rawProducts.map((e) => SizesModel.fromJson(e)).toList();
    return sizes;
  }

}