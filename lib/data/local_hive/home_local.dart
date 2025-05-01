import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AppLocal{
  static Future<void>homeProduct()async{
    final cacheDir=await getApplicationCacheDirectory();
    Hive.init(cacheDir.path);
    final productBox=await Hive.openBox("products");

  }
}