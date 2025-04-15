import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:store_app/Data/repository/Auth_repository.dart';
import 'package:store_app/Features/home_page/manager/home_bloc.dart';
import 'package:store_app/data/repository/products_repository.dart';

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
    create: (context) => ProductRepository(
      client: context.read(),
    ),
  ),
  BlocProvider(
    create: (context) => HomeBloc(repo: context.read()),
  ),
];
