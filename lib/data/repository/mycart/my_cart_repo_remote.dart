import 'package:hive/hive.dart';
import 'package:store_app/data/models/mycart/my_cart_model.dart';
import 'package:store_app/data/repository/mycart/my_cart_interface.dart';

import '../../client.dart';

class MyCartRepositoryRemote implements IMyCartRepository {
  final ApiClient client;

  MyCartRepositoryRemote({required this.client});

  @override
  Future<MyCartModel> fetchMyCart() async {
    final Box<MyCartModel> box = Hive.box<MyCartModel>("myCart");
    final rawMyCart = await client.fetchMyCart();
    final myCart = MyCartModel.fromJson(rawMyCart);

    await box.put("myCart",myCart);
    return myCart;
  }

  @override
  Future<bool> fetchCardDelete(int id) async {
    final success=await client.fetchMyCartDelete(id);
    return success;
    }
  }

