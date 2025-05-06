import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:store_app/Features/details/manager/details_bloc.dart';
import 'package:store_app/Features/home_page/manager/home_bloc.dart';
import 'package:store_app/Features/notification_page/manager/notification_bloc.dart';
import 'package:store_app/Features/saved_page/manager/saved_bloc.dart';
import 'package:store_app/data/repository/categories/categories_repository.dart';
import 'package:store_app/data/repository/details/IdetailsRepository.dart';
import 'package:store_app/data/repository/details/deatils_repository_remote.dart';
import 'package:store_app/data/repository/details/details_repository.dart';
import 'package:store_app/data/repository/details/details_repository_local.dart';
import 'package:store_app/data/repository/notification/notification_repository.dart';
import 'package:store_app/data/repository/notification/notification_repository_interface.dart';
import 'package:store_app/data/repository/notification/notification_repository_local.dart';
import 'package:store_app/data/repository/notification/notification_repository_remote.dart';
import 'package:store_app/data/repository/product/product_repository_interface.dart';
import 'package:store_app/data/repository/product/product_repository_local.dart';
import 'package:store_app/data/repository/product/product_repository_remote.dart';
import 'package:store_app/data/repository/saved/saved_repository.dart';
import 'package:store_app/data/repository/sizes/sizes_repository.dart';

import '../../Data/client.dart';
import '../../data/repository/auth/Auth_repository.dart';
import '../../data/repository/product/products_repository.dart';

final List<SingleChildWidget> providers = [
  Provider(
    create: (context) => ApiClient(),
  ),
  RepositoryProvider(
    create: (context) => NotificationRepositoryLocal(),
  ),
  RepositoryProvider(
    create: (context) => ProductsRepositoryLocal(),
  ),
  RepositoryProvider(
    create: (context) => DetailsRepositoryRemote(
      client: context.read(),
    ),
  ),
  RepositoryProvider(
    create: (context) => DetailsRepositoryLocal(),
  ),
  RepositoryProvider<IDetailsRepository>(
    create: (context) => DetailsRepository(
      repositoryLocal: context.read(),
      repositoryRemote: context.read(),
    ),
  ),
  RepositoryProvider(
    create: (context) => ProductRepositoryRemote(
      client: context.read(),
    ),
  ),
  RepositoryProvider(
    create: (context) => NotificationRepositoryRemote(
      client: context.read(),
    ),
  ),
  RepositoryProvider<INotificationRepository>(
    create: (context) => NotificationRepository(
      localRepo: context.read(),
      remoteRepo: context.read(),
    ),
  ),
  RepositoryProvider<IProductRepository>(
    create: (context) => ProductRepository(
      localProduct: context.read(),
      remoteProduct: context.read(),
    ),
  ),
  BlocProvider(
    create: (context) => NotificationBloc(
      repo: context.read(),
    ),
  ),
  Provider(
    create: (context) => AuthRepository(
      client: context.read(),
    ),
  ),
  Provider(
    create: (context) => SavedRepository(
      client: context.read(),
    ),
  ),
  Provider(
    create: (context) => CategoriesRepository(
      client: context.read(),
    ),
  ),
  Provider(
    create: (context) => SizesRepository(
      client: context.read(),
    ),
  ),
  BlocProvider(
    create: (context) => HomeBloc(
      repo: context.read(),
      categoriesRepo: context.read(),
      sizesRepo: context.read(),
      savedRepo: context.read(),
    ),
  ),
  BlocProvider(
    create: (context) => SavedBloc(repo: context.read()),
  ),
  BlocProvider(
    create: (context) => DetailsBloc(repo: context.read()),
  ),
];
