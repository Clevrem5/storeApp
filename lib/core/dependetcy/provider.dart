import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:store_app/Features/Reviews/manager/review_bloc.dart';
import 'package:store_app/Features/myCart/manager/my_cart_bloc.dart';
import 'package:store_app/Features/my_orders/manager/my_orders_bloc.dart';
import 'package:store_app/data/repository/card/card_repository.dart';
import 'package:store_app/data/repository/mycart/my_cart_repo_local.dart';
import 'package:store_app/data/repository/mycart/my_cart_repo_remote.dart';
import 'package:store_app/data/repository/mycart/my_cart_repository.dart';
import 'package:store_app/data/repository/orders/orders_repository.dart';
import 'package:store_app/data/repository/product/product_repository_local.dart';
import 'package:store_app/data/repository/review/review_repository.dart';
import 'package:store_app/data/repository/review/review_repository_interface.dart';
import 'package:store_app/data/repository/review/review_repository_local.dart';
import 'package:store_app/data/repository/review/review_repository_remote.dart';
import 'package:store_app/data/repository/search/search_interface.dart';
import 'package:store_app/data/repository/search/search_repository.dart';
import 'package:store_app/data/repository/search/search_repository_local.dart';
import 'package:store_app/data/repository/search/search_repository_remote.dart';

import '../../Features/details/manager/details_bloc.dart';
import '../../Features/home_page/manager/home_bloc.dart';
import '../../Features/notification_page/manager/notification_bloc.dart';
import '../../Features/saved_page/manager/saved_bloc.dart';
import '../../Features/search_page/bloc/search_bloc.dart';
import '../../data/client.dart';
import '../../data/repository/auth/Auth_repository.dart';
import '../../data/repository/categories/categories_repository.dart';
import '../../data/repository/details/IdetailsRepository.dart';
import '../../data/repository/details/deatils_repository_remote.dart';
import '../../data/repository/details/details_repository.dart';
import '../../data/repository/details/details_repository_local.dart';
import '../../data/repository/mycart/my_cart_interface.dart';
import '../../data/repository/notification/notification_repository.dart';
import '../../data/repository/notification/notification_repository_interface.dart';
import '../../data/repository/notification/notification_repository_local.dart';
import '../../data/repository/notification/notification_repository_remote.dart';
import '../../data/repository/product/product_repository_interface.dart';
import '../../data/repository/product/product_repository_remote.dart';
import '../../data/repository/product/products_repository.dart';
import '../../data/repository/saved/saved_repository.dart';
import '../../data/repository/sizes/sizes_repository.dart';

final List<SingleChildWidget> providers = [
  // ApiClient provider birinchi bo'lishi kerak
  RepositoryProvider<ApiClient>(
    create: (context) => ApiClient(),
    //
  ),

  // Repository providerlar aniq turdagi Repositorylar bilan
  RepositoryProvider<NotificationRepositoryLocal>(
    create: (context) => NotificationRepositoryLocal(),
  ),

  RepositoryProvider<ProductsRepositoryLocal>(
    create: (context) => ProductsRepositoryLocal(),
  ),

  RepositoryProvider<DetailsRepositoryRemote>(
    create: (context) => DetailsRepositoryRemote(
      client: context.read(),
    ),
  ),
  RepositoryProvider<ReviewRepositoryRemote>(
    create: (context) => ReviewRepositoryRemote(client: context.read()),
  ),
  RepositoryProvider<ReviewRepositoryLocal>(
    create: (context) => ReviewRepositoryLocal(),
  ),
  RepositoryProvider<DetailsRepositoryLocal>(
    create: (context) => DetailsRepositoryLocal(),
  ),

  RepositoryProvider<MyCartRepositoryLocal>(
    create: (context) => MyCartRepositoryLocal(),
  ),

  RepositoryProvider<IDetailsRepository>(
    create: (context) => DetailsRepository(
      repositoryLocal: context.read(),
      repositoryRemote: context.read(),
    ),
  ),

  RepositoryProvider<ProductRepositoryRemote>(
    create: (context) => ProductRepositoryRemote(
      client: context.read(),
    ),
  ),

  RepositoryProvider<MyCartRepositoryRemote>(
    create: (context) => MyCartRepositoryRemote(
      client: context.read(),
    ),
  ),

  RepositoryProvider<NotificationRepositoryRemote>(
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
  RepositoryProvider<IReviewRepository>(
    create: (context) => ReviewRepository(
      localRepo: context.read(),
      remoteRepo: context.read(),
    ),
  ),
  RepositoryProvider<IMyCartRepository>(
    create: (context) => MyCartRepository(
      local: context.read(),
      remote: context.read(),
    ),
  ),

  RepositoryProvider<ISearchRepository>(
    create: (context) => SearchRepository(
      local: context.read(),
      remote: context.read(),
    ),
  ),

  RepositoryProvider<SearchRepositoryRemote>(
    create: (context) => SearchRepositoryRemote(client: context.read()),
  ),

  RepositoryProvider<SearchRepositoryLocal>(
    create: (context) => SearchRepositoryLocal(),
  ),

  // Bloc providerlar
  BlocProvider<NotificationBloc>(
    create: (context) => NotificationBloc(
      repo: context.read(),
    ),
  ),

  BlocProvider<HomeBloc>(
    create: (context) => HomeBloc(
      repo: context.read(),
      categoriesRepo: context.read(),
      sizesRepo: context.read(),
      savedRepo: context.read(),
    ),
  ),

  BlocProvider<SavedBloc>(
    create: (context) => SavedBloc(repo: context.read()),
  ),
  BlocProvider<ReviewBloc>(
    create: (context) => ReviewBloc(
      repo: ReviewRepository(
        remoteRepo: context.read(),
        localRepo: context.read(),
      ),
    ),
  ),

  BlocProvider<DetailsBloc>(
    create: (context) => DetailsBloc(repo: context.read()),
  ),

  BlocProvider<SearchBloc>(
    create: (context) => SearchBloc(
      repo: context.read<ISearchRepository>(),
    ),
  ),

  BlocProvider<MyCartBloc>(
    create: (context) => MyCartBloc(
      repo: context.read(),
      remote: context.read(),
    ),
  ),
  BlocProvider<MyOrdersBloc>(
    create: (context) => MyOrdersBloc(
      repository: context.read(),
    ),
  ),

  // Provider'lar
  Provider<AuthRepository>(
    create: (context) => AuthRepository(
      client: context.read(),
    ),
  ),

  Provider<SavedRepository>(
    create: (context) => SavedRepository(
      client: context.read(),
    ),
  ),
  Provider<OrdersRepository>(
    create: (context) => OrdersRepository(
      client: context.read(),
    ),
  ),

  Provider<CategoriesRepository>(
    create: (context) => CategoriesRepository(
      client: context.read(),
    ),
  ),

  Provider<SizesRepository>(
    create: (context) => SizesRepository(
      client: context.read(),
    ),
  ),
  Provider(
    create: (context) => CardRepository(client: context.read()),
  ),
];
