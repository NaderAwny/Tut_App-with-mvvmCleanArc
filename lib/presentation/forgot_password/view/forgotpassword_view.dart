// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:mvvmclean/app/di.dart';
// import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
// import 'package:mvvmclean/presentation/forgot_password/viewmodel/forgetpassword.dart';
// import 'package:mvvmclean/presentation/resources/assets_manger.dart';
// import 'package:mvvmclean/presentation/resources/color_manger.dart';
// import 'package:mvvmclean/presentation/resources/strings_manger.dart';
// import 'package:mvvmclean/presentation/resources/value_manger.dart';

// class ForgotpasswordView extends StatefulWidget {
//   const ForgotpasswordView({super.key});

//   @override
//   State<ForgotpasswordView> createState() => _ForgotpasswordViewState();
// }

// class _ForgotpasswordViewState extends State<ForgotpasswordView> {
//   final ForgetPasswordViewModel _viewModel =
//       instance<ForgetPasswordViewModel>();
//   final TextEditingController _emailController = TextEditingController();
//   final GlobalKey _formKey = GlobalKey<FormState>();

//   // ignore: strict_top_level_inference
//   bind() {
//     _viewModel.start();
//     _emailController.addListener(() {
//       _viewModel.setEmail(_emailController.text);
//     });

//     //   _viewModel.isUserResetPasswordSuccessfullyStreamController.stream.listen((
//     //     isUserResetPasswordSuccessfully,
//     //   ) {
//     //     if (isUserResetPasswordSuccessfully) {
//     //       // ignore: use_build_context_synchronously
//     //       Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
//     //     }
//     //   });
//   }

//   @override
//   void initState() {
//     bind();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManger.white,
//       body: StreamBuilder<FlowState>(
//         stream: _viewModel.outputState,
//         builder: (context, snapshot) {
//           return snapshot.data?.getScreenWidget(
//                 context,
//                 _getContentWidget(),
//                 () {
//                   _viewModel.resetPassword();
//                 },
//               ) ??
//               _getContentWidget();
//         },
//       ),
//     );
//   }

//   Widget _getContentWidget() {
//     return Container(
//       padding: const EdgeInsets.only(top: AppPadding.p100),
//       child: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Center(child: Image.asset(ImageAssets.splashLogo)),
//               const SizedBox(height: AppSize.s28),

//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: AppPadding.p28,
//                   right: AppPadding.p28,
//                 ),
//                 child: StreamBuilder<bool>(
//                   stream: _viewModel.outIsEmailValid,
//                   builder: (context, snapshot) {
//                     return TextFormField(
//                       style: Theme.of(context).textTheme.titleMedium,
//                       controller: _emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         hintText: AppStrings.userName.tr(),
//                         labelText: AppStrings.userName.tr(),

//                         errorText: (snapshot.data ?? true)
//                             ? null
//                             : AppStrings.invalidEmail.tr(),
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               const SizedBox(height: AppSize.s60),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: AppPadding.p28,
//                   right: AppPadding.p28,
//                 ),
//                 child: StreamBuilder<bool>(
//                   stream: _viewModel.outAreAllInputsValid,
//                   builder: (context, snapshot) {
//                     return SizedBox(
//                       width: double.infinity,
//                       height: AppSize.s40,
//                       child: ElevatedButton(
//                         onPressed: (snapshot.data ?? false)
//                             ? () {
//                                 _viewModel.resetPassword();
//                               }
//                             : null,
//                         child: Text(AppStrings.resetPassword.tr()),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   top: AppPadding.p28,
//                   left: AppPadding.p22,
//                   right: AppPadding.p22,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Flexible(
//                       child: TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           AppStrings.resendEmail.tr(),
//                           style: Theme.of(context).textTheme.titleMedium,
//                           textAlign: TextAlign.center,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 2,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: AppSize.s8),
//                     Flexible(
//                       child: TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           AppStrings.resendEmailSubtitle,
//                           style: Theme.of(context).textTheme.titleMedium,
//                           textAlign: TextAlign.center,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 2,
//                         ).tr(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _viewModel.dispose();
//     super.dispose();
//   }
// }
