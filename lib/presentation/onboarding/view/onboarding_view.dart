import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvmclean/app/app_prefs.dart';
import 'package:mvvmclean/app/di.dart';
import 'package:mvvmclean/domain/model/models.dart';
import 'package:mvvmclean/presentation/onboarding/view_model/onboardingg_viewmodel.dart';
import 'package:mvvmclean/presentation/resources/assets_manger.dart';
import 'package:mvvmclean/presentation/resources/color_manger.dart';
import 'package:mvvmclean/presentation/resources/constants_manger.dart';
import 'package:mvvmclean/presentation/resources/route_manger.dart';
import 'package:mvvmclean/presentation/resources/strings_manger.dart';
import 'package:mvvmclean/presentation/resources/value_manger.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  // second step
  final PageController _pageController = PageController();
  final OnBoardingViewModel viewModel = OnBoardingViewModel();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  // ignore: strict_top_level_inference
  _bind() {
    _appPreferences.setOnBoardingScreenViewed();
    viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // five step
    return StreamBuilder<SliderViewObject>(
      stream: viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManger.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.foregroundColor,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManger.white,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          itemCount: sliderViewObject.numberOfSlides,
          controller: _pageController,
          onPageChanged: (index) {
            viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObject.sliderObject);
          },
        ),

        // sex step
        bottomNavigationBar: Container(
          color: ColorManger.primary,
          height: AppSize.s50,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //widget indicator and arrow
              _getNavgationBarWidget(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _getNavgationBarWidget(SliderViewObject sliderviewobject) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //leftarrow
        Padding(
          padding: EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            onTap: () {
              // go to previous pag
              _pageController.animateToPage(
                viewModel.goPrevious(),
                duration: const Duration(
                  microseconds: AppConstants.sliderAnmiationTime,
                ),
                curve: Curves.bounceInOut,
              );
            },

            child: SizedBox(
              width: AppSize.s20,
              height: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.leftArrowIc),
            ),
          ),
        ),

        //circles indector
        Row(
          children: [
            for (int i = 0; i < sliderviewobject.numberOfSlides; i++)
              Padding(
                padding: EdgeInsets.all(AppPadding.p8),
                child: _getproperCircle(i, sliderviewobject.currentIndex),
              ),
          ],
        ),

        //rightarrow
        Padding(
          padding: EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                viewModel.goNext(),
                duration: const Duration(
                  microseconds: AppConstants.sliderAnmiationTime,
                ),
                curve: Curves.bounceInOut,
              );
            },

            child: SizedBox(
              width: AppSize.s20,
              height: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.rightArrowIc),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getproperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }

  @override
  void dispose() {
    viewModel.dispose();
    _pageController.dispose();
    super.dispose();
  }
}

// foure step
class OnBoardingPage extends StatelessWidget {
  final SliderObject sliderObject;
  const OnBoardingPage(this.sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        SizedBox(height: AppSize.s20),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ).tr(),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ).tr(),
        ),

        SizedBox(height: AppSize.s60),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              child: SvgPicture.asset(sliderObject.image, fit: BoxFit.contain),
            ),
          ),
        ),

        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.loginRoute);
              },
              child: Text(
                AppStrings.skip,
                textAlign: TextAlign.end,

                style: Theme.of(context).textTheme.titleMedium,
              ).tr(),
            ),
          ),
        ),
      ],
    );
  }
}
