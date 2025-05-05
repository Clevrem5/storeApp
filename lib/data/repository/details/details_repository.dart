import 'package:store_app/Data/client.dart';
import 'package:store_app/data/models/details%20model/details_model.dart';

class DetailsRepository{
  final ApiClient client;
  DetailsRepository({required this.client});
  DetailsModel? details;

  Future<DetailsModel>fetchDetails(int id)async{
    final rawDetails=await client.fetchDetails(id);
    details=DetailsModel.fromJson(rawDetails);
    return details!;
  }


}