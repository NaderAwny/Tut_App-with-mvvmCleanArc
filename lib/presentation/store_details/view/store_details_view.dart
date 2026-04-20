// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mvvmclean/app/di.dart';
// import 'package:mvvmclean/domain/model/models.dart';
// import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
// import 'package:mvvmclean/presentation/resources/color_manger.dart';
// import 'package:mvvmclean/presentation/resources/strings_manger.dart';
// import 'package:mvvmclean/presentation/resources/value_manger.dart';
// import 'package:mvvmclean/presentation/store_details/viewmodel/store_details_viewmodel.dart';

// class StoredetailsView extends StatefulWidget {
//   final int storeId;
//   const StoredetailsView({super.key, required this.storeId});

//   @override
//   State<StoredetailsView> createState() => _StoredetailsViewState();
// }

// class _StoredetailsViewState extends State<StoredetailsView> {
//   final StoreDetailsViewModel _viewModel = instance<StoreDetailsViewModel>();
//   // bool isDesktop = ScreenUtil().screenWidth > 800;
//   // ignore: strict_top_level_inference
//   bind() {
//     _viewModel.setStoreId(widget.storeId);
//     _viewModel.start();
//   }

//   @override
//   void initState() {
//     // implement initState
//     super.initState();
//     bind();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<FlowState>(
//         stream: _viewModel.outputState,
//         builder: (context, snapshot) {
//           return Container(
//             child:
//                 snapshot.data?.getScreenWidget(
//                   context,
//                   _getContentWidget(),
//                   () {
//                     _viewModel.start();
//                   },
//                 ) ??
//                 Container(),
//           );
//         },
//       ),
//     );
//   }

//   Widget _getContentWidget() {
//     return Scaffold(
//       backgroundColor: ColorManger.white,
//       appBar: AppBar(
//         title: Text(AppStrings.storeDetails.tr()),
//         elevation: AppSize.s0,
//         iconTheme: IconThemeData(
//           //back button
//           color: ColorManger.white,
//         ),
//         backgroundColor: ColorManger.primary,
//         centerTitle: true,
//       ),
//       body: Container(
//         constraints: BoxConstraints.expand(),
//         color: ColorManger.white,
//         child: SingleChildScrollView(
//           child: StreamBuilder<HomeDetailsObject>(
//             stream: _viewModel.outputStoreDetails,
//             builder: (context, snapshot) {
//               return _getItems(snapshot.data);
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _getItems(HomeDetailsObject? storeDetails) {
//     if (storeDetails != null) {
//       return Padding(
//         padding: const EdgeInsets.all(AppPadding.p12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Container(
//                 width: double.infinity,
//                 height: 250.h,
//                 decoration: BoxDecoration(
//                   //  borderRadius: BorderRadius.circular(AppSize.s12),
//                   // border: Border.all(color: ColorManger.grey, width: AppSize.s1),
//                   image: DecorationImage(
//                     image: NetworkImage(storeDetails.image),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 // child: Image.network(
//                 //   storeDetails.image,
//                 //   fit: BoxFit.cover,
//                 //   width: double.infinity,
//                 //   height: 250,
//                 // ),
//               ),
//             ),
//             _getSection(AppStrings.details.tr()),
//             _getInfoText(storeDetails.details),
//             _getSection(AppStrings.services.tr()),
//             _getInfoText(storeDetails.services),
//             _getSection(AppStrings.about.tr()),
//             _getInfoText(storeDetails.about),
//           ],
//         ),
//       );
//     } else {
//       return Container();
//     }
//   }

//   Widget _getSection(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         top: AppPadding.p16,
//         left: AppPadding.p12,
//         right: AppPadding.p12,
//         bottom: AppPadding.p2,
//       ),
//       child: Text(title, style: Theme.of(context).textTheme.titleMedium),
//     );
//   }

//   Widget _getInfoText(String info) {
//     return Padding(
//       padding: const EdgeInsets.all(AppSize.s12),
//       child: Text(info, style: Theme.of(context).textTheme.bodySmall),
//     );
//   }

//   @override
//   void dispose() {
//     _viewModel.dispose();
//     super.dispose();
//   }
// }
