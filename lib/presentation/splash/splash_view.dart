import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvvmclean/app/app_prefs.dart';
import 'package:mvvmclean/app/di.dart';

import 'package:mvvmclean/presentation/resources/assets_manger.dart';
import 'package:mvvmclean/presentation/resources/color_manger.dart';
import 'package:mvvmclean/presentation/resources/constants_manger.dart';
import 'package:mvvmclean/presentation/resources/route_manger.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  void _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  void _goNext() {
    _appPreferences.getLoggedInStatus().then(
      (isUserLoggedIn) => {
        if (isUserLoggedIn)
          {
            // navigate to main screen
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, Routes.mainRoute),
          }
        else
          {
            _appPreferences.getOnBoardingScreenViewed().then(
              (isOnBoardingScreenViewed) => {
                if (isOnBoardingScreenViewed)
                  {
                    // navigate to login screen
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacementNamed(context, Routes.loginRoute),
                  }
                else
                  {
                    // navigate to onboarding screen
                    Navigator.pushReplacementNamed(
                      // ignore: use_build_context_synchronously
                      context,
                      Routes.onBoardingRoute,
                    ),
                  },
              },
            ),
          },
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.primary,
      body: Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }
}
