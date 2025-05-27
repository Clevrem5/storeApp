class Routes {
  static const String onboarding = '/onboarding';
  static const String onboardingStarted = '/onboarding-started';
  static const String login = '/login';
  static const String home = '/';
  static const String search = '/search-page';
  static const String saved = '/saved-page';
  static const String cart = '/cart-page';
  static const String account = '/account';
  static const String notification = '/notification-page';
  static const String signUp = "/signUp";
  static const String myCart = "/myCart";
  static const String newAddress = "/newAddress";
  static const String resetPasswordEmail = "/reset-password-email";
  static const String resetPasswordCode = "/reset-password-code";
  static const String resetNewPassword = "/reset-new-password";
  static const String checkout = "/checkout";
  static const String details = "/details/:id";
  static const String myDetails = "/myDetails";
  static const String review = "/review/:productId";
  static const String helpCenter = "/helpCenter";
  static const String customerService = "/customer-Service";
  static const String address = "/address";
  static const String myOrders = "/myOrders";
  static const String faqs = "/faqs";
  static const String paymentMethods = "/payment_methods";
  static const String newCard = "/new-card";
  static const String notificationPermission = "/notification";

  static String getReview(int productId) => "/review/$productId";

  static String get(int id) => "/details/$id";
}
