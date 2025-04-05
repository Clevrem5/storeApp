import 'package:go_router/go_router.dart';
import 'package:store_app/core/navigation/routes.dart';
import 'package:store_app/features/login/page/login_detail.dart';
import 'package:store_app/features/store_onboarding/page/onboarding_started.dart';
import 'package:store_app/features/store_onboarding/page/state_oboarding_detail.dart';

import '../../Features/Auth/sign_up/page/sign_up_detail.dart';

final router = GoRouter(
  initialLocation: Routes.onboarding,
  routes: [
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => StoreOnboardingDetail(),
    ),
    GoRoute(
      path: Routes.onboardingStarted,
      builder: (context, state) => OnboardingStarted(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => LoginDetail(),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpDetail(),
    ),
  ],
);
