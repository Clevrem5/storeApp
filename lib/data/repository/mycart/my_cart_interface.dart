import '../../models/mycart/my_cart_model.dart';

abstract interface class IMyCartRepository{
  Future<MyCartModel>fetchMyCart();
  Future<bool>fetchCardDelete(int id);
}