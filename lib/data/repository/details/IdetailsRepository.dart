import '../../models/details model/details_model.dart';

abstract interface class IDetailsRepository{
   Future<DetailsModel>fetchDetails(int id);
}