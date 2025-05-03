import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:store_app/data/models/notification_model/notification_model.dart';

class AppLocal {
  static Future<void> homeProduct() async {
    final cacheDir = await getApplicationCacheDirectory();
    Hive.init(cacheDir.path);
    final productBox = await Hive.openBox("products");
  }

  static Future<dynamic> notifications() async {
    final cacheDir = await getApplicationCacheDirectory();
    Hive.init(cacheDir.path);

    final notificationBox = await Hive.openBox<NotificationModel>("notifications");
    return notificationBox;
  }
}