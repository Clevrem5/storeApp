import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:store_app/Data/repository/Auth_repository.dart';
import 'package:store_app/Data/repository/home_page-repository.dart';

import '../../Data/client.dart';

final List<SingleChildWidget> providers = [
  Provider(
    create: (context) => ApiClient(),
  ),
  Provider(
    create: (context) => AuthRepository(
      client: context.read(),
    ),
  ),
  Provider(
    create: (context) => ProductsRepository(
      client: context.read(),
    ),
  )
];
