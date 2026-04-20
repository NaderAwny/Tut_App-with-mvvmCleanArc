import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvmclean/app/di.dart';
import 'package:mvvmclean/domain/model/models.dart';
import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
import 'package:mvvmclean/presentation/resources/color_manger.dart';
import 'package:mvvmclean/presentation/resources/strings_manger.dart';
import 'package:mvvmclean/presentation/resources/value_manger.dart';
import 'package:mvvmclean/presentation/store_details/cubit/store_deatlis_cubit.dart';
import 'package:mvvmclean/presentation/store_details/cubit/store_detalis_state.dart';

class StoreDetalisViewCubit extends StatelessWidget {
  final int storeId;
  const StoreDetalisViewCubit({super.key, required this.storeId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<StoreDetailsCubit>()
        ..setStoreId(storeId)
        ..getStoreDetails(storeId),

      child: Scaffold(
        body: BlocBuilder<StoreDetailsCubit, StoreDetailsState>(
          builder: (context, state) {
            return Container(
              child:
                  state.flowState?.getScreenWidget(
                    context,
                    _getContentWidget(context),
                    () {
                      context.read<StoreDetailsCubit>().getStoreDetails(
                        storeId,
                      );
                    },
                  ) ??
                  Container(),
            );
          },
        ),
      ),
    );
  }

  Widget _getContentWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.white,
      appBar: AppBar(
        title: Text(AppStrings.storeDetails.tr()),
        elevation: AppSize.s0,
        iconTheme: IconThemeData(
          //back button
          color: ColorManger.white,
        ),
        backgroundColor: ColorManger.primary,
        centerTitle: true,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: ColorManger.white,
        child: SingleChildScrollView(
          child: BlocBuilder<StoreDetailsCubit, StoreDetailsState>(
            builder: (context, state) {
              return _getItems(state.homeDetailsObject, context);
            },
          ),
        ),
      ),
    );
  }

  Widget _getItems(HomeDetailsObject? storeDetails, BuildContext context) {
    if (storeDetails != null) {
      return Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: double.infinity,
                height: 250.h,
                decoration: BoxDecoration(
                  //  borderRadius: BorderRadius.circular(AppSize.s12),
                  // border: Border.all(color: ColorManger.grey, width: AppSize.s1),
                  image: DecorationImage(
                    image: NetworkImage(storeDetails.image),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: Image.network(
                //   storeDetails.image,
                //   fit: BoxFit.cover,
                //   width: double.infinity,
                //   height: 250,
                // ),
              ),
            ),
            _getSection(AppStrings.details.tr(), context),
            _getInfoText(storeDetails.details, context),
            _getSection(AppStrings.services.tr(), context),
            _getInfoText(storeDetails.services, context),
            _getSection(AppStrings.about.tr(), context),
            _getInfoText(storeDetails.about, context),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getSection(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppPadding.p16,
        left: AppPadding.p12,
        right: AppPadding.p12,
        bottom: AppPadding.p2,
      ),
      child: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }

  Widget _getInfoText(String info, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s12),
      child: Text(info, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
