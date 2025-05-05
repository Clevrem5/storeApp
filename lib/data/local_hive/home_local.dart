import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:store_app/data/models/home_models/home_page_model.dart';
import 'package:store_app/data/models/notification_model/notification_model.dart';

class AppLocal {
  static Future<dynamic> homeProduct() async {
    final cacheDir = await getApplicationCacheDirectory();
    Hive.init(cacheDir.path);
    final productBox = await Hive.openBox<ProductsModel>("products");
    return productBox;
  }

  static Future<dynamic> notifications() async {
    final cacheDir = await getApplicationCacheDirectory();
    Hive.init(cacheDir.path);

    final notificationBox = await Hive.openBox<NotificationModel>("notifications");
    return notificationBox;
  }
  static  Future<void>myCart()async{
    final cacheDir=await getApplicationCacheDirectory();
    Hive.init(cacheDir.path);
    await Hive.openBox("myCarts");
  }
  static  Future<void>Details()async{
    final cacheDir=await getApplicationCacheDirectory();
    Hive.init(cacheDir.path);
    await Hive.openBox("details");
  }
}