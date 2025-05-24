import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:store_app/data/models/mycart/my_cart_model.dart';
import 'package:store_app/data/repository/mycart/my_cart_interface.dart';
import 'package:store_app/data/repository/mycart/my_cart_repo_local.dart';
import 'package:store_app/data/repository/mycart/my_cart_repo_remote.dart';

class MyCartRepository implements IMyCartRepository {
  final MyCartRepositoryRemote remote;
  final MyCartRepositoryLocal local;

  MyCartRepository({required this.remote, required this.local});

  @override
  Future<MyCartModel> fetchMyCart() async {
    final result = await Connectivity().checkConnectivity();
    final isOnline = result.contains(ConnectivityResult.mobile) || result.contains(ConnectivityResult.wifi);
    if (isOnline) {
      return await remote.fetchMyCart();
    } else {
      return await local.fetchMyCart();
    }
  }
  @override
  Future<bool> fetchCardDelete(int id) async{
    return true;
    // final result = await Connectivity().checkConnectivity();
    // final isOnline = result.contains(ConnectivityResult.mobile) || result.contains(ConnectivityResult.wifi);
    // if (isOnline) {
    //   return true;
    // } else {
    //   return false;
    // }
  }
}
