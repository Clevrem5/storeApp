import 'package:hive/hive.dart';
import 'package:store_app/data/models/details%20model/details_model.dart';
import 'package:store_app/data/repository/details/IdetailsRepository.dart';

class DetailsRepositoryLocal implements IDetailsRepository {
  final Box<DetailsModel> box = Hive.box<DetailsModel>("details2");

  @override
  Future<DetailsModel> fetchDetails(int id) async {
    try {
      return box.values.firstWhere((e) => e.id == id);
    } catch (_) {
      throw Exception("nimadir");// topilmasa null qaytadi
    }
  }


}
