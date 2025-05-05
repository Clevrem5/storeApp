import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/Auth/login/manger/login_bloc.dart';
import 'package:store_app/Features/Auth/reset_password/manager/reset_bloc.dart';
import 'package:store_app/Features/Auth/sign_up/manager/sign_up_bloc.dart';
import 'package:store_app/Features/Reviews/pages/rewiew_page.dart';
import 'package:store_app/Features/details/manager/details_bloc.dart';
import 'package:store_app/Features/faqs/page/faqs_detail.dart';
import 'package:store_app/Features/help_center/pages/help_center_View.dart';
import 'package:store_app/Features/home_page/manager/home_bloc.dart';
import 'package:store_app/Features/map_page/page/new_adress_detail.dart';
import 'package:store_app/Features/my_details/manager/my_details_bloc.dart';
import 'package:store_app/Features/my_details/page/my_details_detail.dart';
import 'package:store_app/Features/my_details/pages/my_detail_view.dart';
import 'package:store_app/Features/notification_page/manager/notification_bloc.dart';
import 'package:store_app/Features/payment_methods/page/methods_new_card_detail.dart';
import 'package:store_app/Features/payment_methods/page/payment_methods_detail.dart';
import 'package:store_app/Features/saved_page/manager/saved_event.dart';
import 'package:store_app/core/navigation/routes.dart';
import 'package:store_app/features/home_page/page/home_page_detail.dart';
import 'package:store_app/features/notification_page/page/notification_detail.dart';
import 'package:store_app/features/saved_page/page/saved_detail.dart';
import 'package:store_app/features/search_page/page/search_detai.dart';
import 'package:store_app/main.dart';

import '../../Data/repository/Auth_repository.dart';
import '../../Features/Auth/login/page/login_detail.dart';
import '../../Features/Auth/reset_password/page/reset_new_password.dart';
import '../../Features/Auth/reset_password/page/reset_password_code.dart';
import '../../Features/Auth/reset_password/page/reset_password_email.dart';
import '../../Features/Auth/sign_up/page/sign_up_detail.dart';
import '../../Features/Auth/store_onboarding/page/onboarding_started.dart';
import '../../Features/Auth/store_onboarding/page/state_oboarding_detail.dart';
import '../../Features/account_page/page/account_detail.dart';
import '../../Features/checkout/presentation/page/adress_view.dart';
import '../../Features/checkout/presentation/page/checkout.dart';
import '../../Features/details/page/product_details.dart';
import '../../Features/my orders/page/my_orders_view.dart';
import '../../Features/myCart/presentation/page/cart_detail.dart';
import '../../Features/notification_page/page/notification_permision.dart';
import '../../Features/saved_page/manager/saved_bloc.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.login,
  routes: [
    GoRoute(
      path: Routes.newAddress,
      builder: (context, state) => NewAddressDetail(),
    ),
    GoRoute(
      path: Routes.resetPasswordEmail,
      builder: (context, state) => BlocProvider(
        create: (context) => ResetPasswordBloc(authRepository: context.read()),
        child: ResetPasswordEmailDetail(),
      ),
    ),
    GoRoute(
      path: Routes.resetPasswordCode,
      builder: (context, state) {
        final email = state.extra as String;
        return BlocProvider(
          create: (context) => ResetPasswordBloc(authRepository: context.read()),
          child: ResetPasswordCode(email: email),
        );
      },
    ),
    GoRoute(
      path: Routes.resetNewPassword,
      builder: (context, state) {
        final extra = state.extra as Map<String, String>;
        final email = extra['email']!;
        final code = extra['code']!;
        return BlocProvider(
          create: (context) => ResetPasswordBloc(authRepository: context.read()),
          child: ResetPasswordPage(email: email, code: code),
        );
      },
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => StoreOnboardingDetail(),
    ),
    GoRoute(
      path: Routes.myDetails,
      builder: (context, state) => BlocProvider(
          create: (context) => MyDetailsBloc(
                repo: context.read(),
              ),
          child: MyDetailView()),
    ),
    GoRoute(
      path: Routes.helpCenter,
      builder: (context, state) => HelpCenterScreen(),
    ),
    GoRoute(
      path: Routes.details,
      builder: (context, state) => BlocProvider(
          create: (context) => DetailsBloc(
                repo: context.read(),
              )..add(
                  DetailsLoad(
                    id: int.parse(state.pathParameters['id']!),
                  ),
                ),
          child: ProductDetails()),
    ),
    GoRoute(
      path: Routes.checkout,
      builder: (context, state) => CheckoutPage(),
    ),
    GoRoute(
      path: Routes.onboardingStarted,
      builder: (context, state) => OnboardingStarted(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginBloc(
          repo: context.read<AuthRepository>(),
        ),
        child: LoginDetail(),
      ),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => BlocProvider(
        create: (context) => HomeBloc(
          repo: context.read(),
          categoriesRepo: context.read(),
          sizesRepo: context.read(),
          savedRepo: context.read(),
        )
          ..add(HomeLoad())
          ..add(CategoriesLoadEvent())
          ..add(SizesLoadEvent()),
        child: HomePageDetail(),
      ),
    ),
    GoRoute(
      path: Routes.search,
      builder: (context, state) => SearchDetail(),
    ),
    GoRoute(
      path: Routes.saved,
      builder: (context, state) => BlocProvider(
          create: (context) => SavedBloc(
                repo: context.read(),
              )..add(SavedLoad()),
          child: SavedDetail()),
    ),
    GoRoute(
      path: Routes.cart,
      builder: (context, state) => CartDetail(),
    ),
    GoRoute(
      path: Routes.account,
      builder: (context, state) => AccountDetail(),
    ),
    GoRoute(
      path: Routes.notification,
      builder: (context, state) => BlocProvider(
        create: (context) => NotificationBloc(
          repo: context.read(),
        ),
        child: NotificationDetail(),
      ),
    ),
    GoRoute(
      path: Routes.address,
      builder: (context, state) => AddressView(),
    ),
    GoRoute(
      path: Routes.notificationPermission,
      builder: (context, state) => MainScreen(),
    ),
    GoRoute(
      path: Routes.myOrders,
      builder: (context, state) => MyOrdersPage(),
    ),
    GoRoute(
      path: Routes.faqs,
      builder: (context, state) => FaqsDetail(),
    ),
    GoRoute(
      path: Routes.myDetails,
      builder: (context, state) => BlocProvider(
          create: (context) => MyDetailsBloc(
                repo: context.read(),
              ),
          child: MyDetailsDetail()),
    ),
    GoRoute(
      path: Routes.paymentMethods,
      builder: (context, state) => PaymentMethodsDetail(),
    ),
    GoRoute(
      path: Routes.newCard,
      builder: (context, state) => MethodsNewCardDetail(),
    ),
    GoRoute(
      path: Routes.review,
      builder: (context, state) => ReviewPage(),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => BlocProvider(
        create: (context) => SignUpBloc(
          repo: context.read<AuthRepository>(),
        ),
        child: SignUpDetail(),
      ),
    ),
  ],
);
