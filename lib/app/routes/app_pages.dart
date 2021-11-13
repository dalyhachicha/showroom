import 'package:get/get.dart';

import 'package:showroom/app/modules/cart/bindings/cart_binding.dart';
import 'package:showroom/app/modules/cart/views/cart_view.dart';
import 'package:showroom/app/modules/history/bindings/history_binding.dart';
import 'package:showroom/app/modules/history/views/history_view.dart';
import 'package:showroom/app/modules/home/bindings/home_binding.dart';
import 'package:showroom/app/modules/home/views/home_view.dart';
import 'package:showroom/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:showroom/app/modules/onboarding/views/onboarding_view.dart';
import 'package:showroom/app/modules/product/bindings/product_binding.dart';
import 'package:showroom/app/modules/product/views/product_view.dart';
import 'package:showroom/app/modules/splash/bindings/splash_binding.dart';
import 'package:showroom/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
  ];
}
