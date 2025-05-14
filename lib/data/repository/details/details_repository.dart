import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:store_app/data/models/details%20model/details_model.dart';
import 'package:store_app/data/repository/details/IdetailsRepository.dart';
import 'package:store_app/data/repository/details/deatils_repository_remote.dart';
import 'package:store_app/data/repository/details/details_repository_local.dart';

class DetailsRepository implements IDetailsRepository {
  final DetailsRepositoryRemote repositoryRemote;
  final DetailsRepositoryLocal repositoryLocal;

  DetailsRepository({
    required this.repositoryLocal,
    required this.repositoryRemote,
  });

  @override
  Future<DetailsModel>fetchDetails(int id)async{
    final connectResult = await Connectivity().checkConnectivity();
    final isOnline = connectResult.contains(ConnectivityResult.mobile) || connectResult.contains(ConnectivityResult.wifi);
    if (isOnline) {
      return await repositoryRemote.fetchDetails(id);
    } else {
      return await repositoryLocal.fetchDetails(id);
    }
  }

  @override
  Future<bool> fetchAddCart(int productId, int sizeId) async {
    final result = await repositoryRemote.fetchAddCart(productId, sizeId);
    if (result) {
      return true;
    } else {
      return false;
    }
  }
}
