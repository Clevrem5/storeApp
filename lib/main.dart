import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:store_app/Core/dependetcy/provider.dart';
import 'package:store_app/data/local_hive/home_local.dart';
import 'package:store_app/data/models/details%20model/details_model.dart';
import 'package:store_app/data/models/home_models/home_page_model.dart';

import 'core/navigation/router.dart';
import 'data/models/notification_model/notification_model.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(NotificationAdapter());
  Hive.registerAdapter(ProductsAdapter());
  Hive.registerAdapter(DetailsModelAdapter());
  AppLocal.homeProduct();
  AppLocal.notifications();
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MultiProvider(
          providers: providers,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: "GeneralSans", colorSchemeSeed: Colors.white),
            routerConfig: router,
          ),
        );
      },
    );
  }
}
