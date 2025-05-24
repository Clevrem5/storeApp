import 'package:hive/hive.dart';
import 'package:store_app/Core/exceptions/custom_exception.dart';
import 'package:store_app/data/models/mycart/my_cart_model.dart';
import 'package:store_app/data/repository/mycart/my_cart_interface.dart';

class MyCartRepositoryLocal implements IMyCartRepository{
  final Box<MyCartModel> box =Hive.box<MyCartModel>("myCart");
  @override
  Future<MyCartModel> fetchMyCart() async {
    try {
      final key = "myCart"; // yoki aniq key: "myCart"
      final cart = box.get(key);
      if (cart == null) throw CustomException(message: "No cart found");
      return cart;
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<bool> fetchCardDelete(int id) async{
    box.deleteAt(id);
    return true;
    }
  
  
}