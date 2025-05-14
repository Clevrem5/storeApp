import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:store_app/data/models/details%20model/product_images_model.dart';
import 'package:store_app/data/models/mycart/my_cart_convertor.dart';
import 'package:store_app/data/models/mycart/my_cart_model.dart';

import '../models/details model/details_model.dart';
import '../models/home_models/home_page_model.dart';
import '../models/notification_model/notification_model.dart';

class AppLocal {
  static bool _isInitialized = false;

  static Future<void> initHive() async {
    if (_isInitialized) return;

    final cacheDir = await getApplicationCacheDirectory();
    Hive.init(cacheDir.path);

    Hive.registerAdapter(ProductsAdapter());
    Hive.registerAdapter(NotificationAdapter());
    Hive.registerAdapter(DetailsAdapter());
    Hive.registerAdapter(ProductImagesAdapter());
    Hive.registerAdapter(MyCartAdapter());
    Hive.registerAdapter(MyCartItemsAdapter());
    await Hive.deleteBoxFromDisk('details2');
    await Hive.deleteBoxFromDisk('myCart');
    await Hive.openBox<ProductsModel>("products");
    await Hive.openBox<ProductsModel>("search");
    await Hive.openBox<String>('searchHistory');
    await Hive.openBox<NotificationModel>("notifications");
    await Hive.openBox<DetailsModel>("details2");
    await Hive.openBox<MyCartModel>("myCart");

    _isInitialized = true;
  }


}
