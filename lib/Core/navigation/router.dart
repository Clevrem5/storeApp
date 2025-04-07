import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/Features/Auth/login/manger/login_bloc.dart';
import 'package:store_app/Features/Auth/reset_password/page/reset_new_password.dart';
import 'package:store_app/Features/Auth/reset_password/page/reset_password_code.dart';
import 'package:store_app/Features/Auth/reset_password/page/reset_password_email.dart';
import 'package:store_app/Features/Auth/sign_up/manager/sign_up_bloc.dart';
import 'package:store_app/core/navigation/routes.dart';
import 'package:store_app/features/account_page/page/account_detail.dart';
import 'package:store_app/features/cart_page/page/cart_detail.dart';
import 'package:store_app/features/home_page/page/home_page_detail.dart';
import 'package:store_app/features/notification_page/page/notification_detail.dart';
import 'package:store_app/features/saved_page/page/saved_detail.dart';
import 'package:store_app/features/search_page/page/search_detai.dart';
import '../../Data/repository/sign_up_repository.dart';
import '../../Features/Auth/login/page/login_detail.dart';
import '../../Features/Auth/sign_up/page/sign_up_detail.dart';
import '../../Features/Auth/store_onboarding/page/onboarding_started.dart';
import '../../Features/Auth/store_onboarding/page/state_oboarding_detail.dart';

final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => StoreOnboardingDetail(),
    ),
    GoRoute(
      path: Routes.resetPasswordEmail,
      builder: (context, state) => ResetPasswordEmailDetail(),
    ),
    GoRoute(
      path: Routes.resetPasswordCode,
      builder: (context, state) => ResetPasswordCode(),
    ),
    GoRoute(
      path: Routes.resetNewPassword,
      builder: (context, state) => ResetNewPassword(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => StoreOnboardingDetail(),
    ),   GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => StoreOnboardingDetail(),
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
      builder: (context, state) => HomePageDetail(),
    ),
    GoRoute(
      path: Routes.search,
      builder: (context, state) => SearchDetail(),
    ),
    GoRoute(
      path: Routes.saved,
      builder: (context, state) => SavedDetail(),
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
      builder: (context, state) => NotificationDetail(),
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
