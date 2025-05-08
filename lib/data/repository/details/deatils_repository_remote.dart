import 'package:hive/hive.dart';
import 'package:store_app/data/repository/details/IdetailsRepository.dart';
import '../../client.dart';
import '../../models/details model/details_model.dart';

class DetailsRepositoryRemote implements IDetailsRepository {
  final ApiClient client;

  DetailsRepositoryRemote({required this.client});



  @override
  Future<DetailsModel> fetchDetails(int id) async {
    final Box<DetailsModel> box = Hive.box<DetailsModel>("details2");
    final rawDetails = await client.fetchDetails(id);
   final details = DetailsModel.fromJson(rawDetails) ;


    await box.put(id, details);
    return details;
  }
}
