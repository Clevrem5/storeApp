import 'package:store_app/data/client.dart';

import '../../models/my_orders_model/my_orders_model.dart';

class OrdersRepository {
  final ApiClient client;

  OrdersRepository({required this.client});

  Future<List<MyOrdersModel>> fetchOrders() async {
    final rawOrders = await client.fetchOrders();
    final orders = rawOrders.map((e) => MyOrdersModel.fromJson(e)).toList();
    return orders;
  }
}
