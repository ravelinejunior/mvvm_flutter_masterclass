import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:mvvm_flutter_masterclass/domain/di/di.dart';
import 'package:mvvm_flutter_masterclass/presentation/boarding/boarding_view.dart';
import 'package:mvvm_flutter_masterclass/presentation/login/login_view.dart';
import 'package:mvvm_flutter_masterclass/presentation/password/password_view.dart';
import 'package:mvvm_flutter_masterclass/presentation/register/register_view.dart';
import 'package:mvvm_flutter_masterclass/presentation/splash/splash_view.dart';

import '../../main.dart';

class Routes {
  List<GetPage<dynamic>>? getPageList = [
    GetPage(
      name: ConstantsRoutes.splashRoute,
      page: () => const SplashView(),
      transition: Transition.upToDown,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linear,
    ),
    GetPage(
      name: ConstantsRoutes.mainRoute,
      page: () => const MyApp(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linear,
    ),
    GetPage(
      name: ConstantsRoutes.onBoardingRoute,
      page: () => const BoardingView(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linear,
    ),
    GetPage(
      name: ConstantsRoutes.loginRoute,
      page: () {
        initLoginModule();
        return LoginView();
      },
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linear,
    ),
    GetPage(
      name: ConstantsRoutes.registerRoute,
      page: () => const RegisterView(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linear,
    ),
    GetPage(
      name: ConstantsRoutes.forgotPasswordRoute,
      page: () => const PasswordView(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linear,
    ),
    GetPage(
      name: ConstantsRoutes.storeDetailRoute,
      page: () => const MyApp(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linear,
    ),
  ];
}

class ConstantsRoutes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailRoute = "/storeDetail";
}
