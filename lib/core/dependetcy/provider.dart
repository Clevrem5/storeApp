import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:store_app/Data/repository/Auth_repository.dart';
import 'package:store_app/Features/details/manager/details_bloc.dart';
import 'package:store_app/Features/home_page/manager/home_bloc.dart';
import 'package:store_app/Features/notification_page/manager/notification_bloc.dart';
import 'package:store_app/Features/saved_page/manager/saved_bloc.dart';
import 'package:store_app/data/repository/notification/notification_repository.dart';
import 'package:store_app/data/repository/notification/notification_repository_interface.dart';
import 'package:store_app/data/repository/notification/notification_repository_local.dart';
import 'package:store_app/data/repository/notification/notification_repository_remote.dart';

import '../../Data/client.dart';
import '../../data/repository/product/products_repository.dart';

final List<SingleChildWidget> providers = [
  Provider(
    create: (context) => ApiClient(),
  ),
  RepositoryProvider(
    create: (context) => NotificationRepositoryLocal(),
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
    create: (context) => ProductRepository(
      client: context.read(),
    ),
  ),
  BlocProvider(
    create: (context) => HomeBloc(repo: context.read()),
  ),
  BlocProvider(
    create: (context) => SavedBloc(repo: context.read()),
  ),
  BlocProvider(
    create: (context) => DetailsBloc(repo: context.read()),
  ),
];
