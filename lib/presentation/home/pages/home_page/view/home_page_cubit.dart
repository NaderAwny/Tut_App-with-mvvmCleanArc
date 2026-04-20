import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvmclean/app/di.dart';
import 'package:mvvmclean/domain/model/models.dart';
import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
import 'package:mvvmclean/presentation/home/pages/home_page/cubit/home_cubit.dart';
import 'package:mvvmclean/presentation/home/pages/home_page/cubit/home_state.dart';
import 'package:mvvmclean/presentation/resources/color_manger.dart';
import 'package:mvvmclean/presentation/resources/route_manger.dart';
import 'package:mvvmclean/presentation/resources/strings_manger.dart';
import 'package:mvvmclean/presentation/resources/value_manger.dart';

class HomePageCubit extends StatelessWidget {
  const HomePageCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<HomeCubit>()..getHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return state.flowState?.getScreenWidget(
                        context,
                        _getContentWidget(),
                        () {
                          context.read<HomeCubit>().getHomeData();
                        },
                      ) ??
                      _getContentWidget();
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getBannersCarousel(state.homeRefactor?.banners),
            _getSection(AppStrings.services.tr(), context),
            _getServices(state.homeRefactor?.services),
            _getSection(AppStrings.stores.tr(), context),
            _getStores(state.homeRefactor?.stores, context),
          ],
        );
      },
    );
  }

  // Widget _getBannersCarousel() {
  //   return StreamBuilder<HomeRefactor>(
  //     stream: _viewModel.homeOutput,
  //     builder: (context, snapshot) {
  //       return _getBannersWidget(snapshot.data?.banners);
  //     },
  //   );
  // }

  Widget _getBannersCarousel(List<BannerAD>? banner) {
    if (banner != null) {
      return CarouselSlider(
        items: banner
            .map(
              (banner) => SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: AppPadding.p12),
                  child: Card(
                    elevation: AppSize.s1_5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                      side: BorderSide(
                        color: ColorManger.white,
                        width: AppSize.s1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s12.r),
                      child: Image.network(banner.image, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
          height: 200.h,
          // MediaQuery.of(context).size.height * 0.22,
          autoPlay: true,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getSection(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppPadding.p12,
        left: AppPadding.p12,
        right: AppPadding.p12,
        bottom: AppPadding.p2,
      ),
      child: Text(title, style: Theme.of(context).textTheme.labelSmall).tr(),
    );
  }

  // Widget _getServices() {
  //   return StreamBuilder<HomeRefactor>(
  //     stream: _viewModel.homeOutput,
  //     builder: (context, snapshot) {
  //       return _getServicesWidget(snapshot.data?.services);
  //     },
  //   );
  // }

  Widget _getServices(List<ServicesAd>? services) {
    if (services != null) {
      return Padding(
        padding: EdgeInsets.only(left: AppPadding.p12, right: AppPadding.p12.r),
        child: Container(
          height: 210.h,
          // MediaQuery.of(context).size.height * 0.25,
          //   width: MediaQuery.of(context).size.width * 0.50,
          margin: EdgeInsets.symmetric(vertical: AppMarign.m8),
          child: ListView.builder(
            itemCount: services.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Card(
                elevation: AppSize.s4.sp,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12.r),
                  side: BorderSide(color: ColorManger.white, width: AppSize.s1),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s12.r),
                      child: Image.network(
                        width: 165.w,
                        // MediaQuery.of(context).size.width * 0.45,
                        height: 160.h,
                        // MediaQuery.of(context).size.height * 0.185,
                        services[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: AppPadding.p8),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          services[index].title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ).tr(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  // Widget _getStores() {
  //   return StreamBuilder<HomeRefactor>(
  //     stream: _viewModel.homeOutput,
  //     builder: (context, snapshot) {
  //       return _getStoresWidget(snapshot.data?.stores);
  //     },
  //   );
  // }

  Widget _getStores(List<Store>? stores, BuildContext context) {
    if (stores != null) {
      return Padding(
        padding: EdgeInsets.only(
          left: AppPadding.p12,
          right: AppPadding.p12,
          top: AppPadding.p12,
        ),
        child: Flex(
          direction: Axis.vertical,
          children: [
            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: AppSize.s8,
              crossAxisSpacing: AppSize.s8,
              physics: PageScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(stores.length, (index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.storeDetalisRoute,
                      arguments: stores[index].id,
                    );
                  },
                  child: Card(
                    elevation: AppSize.s4,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: ColorManger.white,
                        width: AppSize.s1,
                      ),
                    ),
                    child: ClipRRect(
                      child: Image.network(
                        width: 165.w,
                        // MediaQuery.of(context).size.width * 0.2,
                        height: 165.h,
                        // MediaQuery.of(context).size.height * 0.1,
                        stores[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
