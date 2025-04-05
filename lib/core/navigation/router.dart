import 'package:go_router/go_router.dart';
import 'package:store_app/core/navigation/routes.dart';
import 'package:store_app/features/account_page/page/account_detail.dart';
import 'package:store_app/features/cart_page/page/cart_detail.dart';
import 'package:store_app/features/home_page/page/home_page_detail.dart';
import 'package:store_app/features/login/page/login_detail.dart';
import 'package:store_app/features/saved_page/page/saved_detail.dart';
import 'package:store_app/features/search_page/page/search_detai.dart';
import 'package:store_app/features/store_onboarding/page/onboarding_started.dart';
import 'package:store_app/features/store_onboarding/page/state_oboarding_detail.dart';

final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(path: Routes.onboarding,builder: (context, state) => StoreOnboardingDetail(),),
    GoRoute(path: Routes.onboardingStarted,builder: (context, state) => OnboardingStarted(),),
    GoRoute(path: Routes.login,builder: (context, state) => LoginDetail(),),
    GoRoute(path: Routes.home,builder: (context, state) => HomePageDetail(),),
    GoRoute(path: Routes.search,builder: (context, state) => SearchDetail(),),
    GoRoute(path: Routes.saved,builder: (context, state) => SavedDetail(),),
    GoRoute(path: Routes.cart,builder: (context, state) => CartDetail(),),
    GoRoute(path: Routes.account,builder: (context, state) => AccountDetail(),),
  ]
);