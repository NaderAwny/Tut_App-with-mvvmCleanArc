import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mvvmclean/app/di.dart';
import 'package:mvvmclean/presentation/forgot_password/view/forget_password_viewcuibit.dart';
// import 'package:mvvmclean/presentation/forgot_password/view/forgotpassword_view.dart';
import 'package:mvvmclean/presentation/login/view/login_cubit_view.dart';
import 'package:mvvmclean/presentation/home/main_view.dart';
import 'package:mvvmclean/presentation/onboarding/view/onboarding_view.dart';
import 'package:mvvmclean/presentation/register/view/register_view_cubit.dart';
import 'package:mvvmclean/presentation/resources/strings_manger.dart';
import 'package:mvvmclean/presentation/splash/splash_view.dart';
//import 'package:mvvmclean/presentation/store_details/view/store_details_view.dart';
import 'package:mvvmclean/presentation/store_details/view/store_detalis_view_cubit.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetalisRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());

      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginCubitView());
      case Routes.registerRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => RegisterViewCubit());
      case Routes.forgotPasswordRoute:
        initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => ForgetPasswordViewCubit());

      case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetalisRoute:
        final int id = settings.arguments as int;
        initStoreDetailsModule();
        return MaterialPageRoute(
          builder: (_) => StoreDetalisViewCubit(storeId: id),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound).tr(),
        ), //todo move this to Strings manager

        body: Center(
          child: Text(AppStrings.noRouteFound).tr(),
        ), //todo move this to Strings manager
      ),
    );
  }
}
