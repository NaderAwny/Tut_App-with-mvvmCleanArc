// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:mvvmclean/app/app_prefs.dart';
// import 'package:mvvmclean/app/di.dart';
// // ignore: library_prefixes
// import 'package:flutter/scheduler.dart';
// import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
// import 'package:mvvmclean/presentation/login/viewmodel/login_viewmodel.dart';
// import 'package:mvvmclean/presentation/resources/assets_manger.dart';
// import 'package:mvvmclean/presentation/resources/color_manger.dart';
// import 'package:mvvmclean/presentation/resources/route_manger.dart';
// import 'package:mvvmclean/presentation/resources/strings_manger.dart';
// import 'package:mvvmclean/presentation/resources/value_manger.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({super.key});

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   final LoginViewModel _viewModel = instance<LoginViewModel>();
//   final AppPreferences _appPreferences = instance<AppPreferences>();
//   final TextEditingController _userNameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final GlobalKey _formKey = GlobalKey<FormState>();
//   // ignore: strict_top_level_inference
//   bind() {
//     _viewModel.start(); // tell viewmodel, start ur job
//     _userNameController.addListener(
//       () => _viewModel.setUserName(_userNameController.text),
//     );
//     _passwordController.addListener(
//       () => _viewModel.setPassword(_passwordController.text),
//     );
//     _viewModel.isUserLoggedInSuccessfullyStreamController.stream.listen((
//       isLoggedIn,
//     ) {
//       if (isLoggedIn) {
//         SchedulerBinding.instance.addPostFrameCallback((_) {
//           _appPreferences.setLoggedInStatus();
//           Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
//         });
//       }
//     });
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
//         //outputState is straem from basedviewmodel view th content state
//         stream: _viewModel.outputState,

//         // builder: (context, snapshot) {
//         //   return snapshot.data?.getScreenWidget(
//         //         context,
//         //         _getContentWidget(),
//         //         () {
//         //           _viewModel.login();
//         //         },
//         //       ) ??
//         //       _getContentWidget();
//         builder: (context, snapshot) {
//           return snapshot.data?.getScreenWidget(
//                 context,
//                 _getContentWidget(),
//                 () {
//                   _viewModel.login();
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
//               const Center(
//                 child: Image(image: AssetImage(ImageAssets.splashLogo)),
//               ),
//               const SizedBox(height: AppSize.s28),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: AppPadding.p28,
//                   right: AppPadding.p28,
//                 ),
//                 child: StreamBuilder<bool>(
//                   stream: _viewModel.outIsUserNameValid,
//                   builder: (context, snapshot) {
//                     return TextFormField(
//                       style: Theme.of(context).textTheme.titleMedium,
//                       controller: _userNameController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         hintText: AppStrings.email.tr(),
//                         labelText: AppStrings.email.tr(),
//                         errorText: (snapshot.data ?? true)
//                             ? null
//                             : AppStrings.invalidEmail.tr(),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: AppSize.s28),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: AppPadding.p28,
//                   right: AppPadding.p28,
//                 ),
//                 child: StreamBuilder<bool>(
//                   stream: _viewModel.outIsPasswordValid,
//                   builder: (context, snapshot) {
//                     return TextFormField(
//                       style: Theme.of(context).textTheme.titleMedium,
//                       controller: _passwordController,
//                       keyboardType: TextInputType.visiblePassword,
//                       decoration: InputDecoration(
//                         hintText: AppStrings.password.tr(),
//                         labelText: AppStrings.password.tr(),
//                         errorText: (snapshot.data ?? true)
//                             ? null
//                             : AppStrings.passwordError.tr(),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: AppSize.s28),
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
//                             ? () => _viewModel.login()
//                             : null,
//                         child: Text(AppStrings.login.tr()),
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               // Text(
//               //   AppStrings.ForgetPassword,
//               //   style: Theme.of(context).textTheme.titleMedium,
//               //   textAlign: TextAlign.center,      // ← محاذاة في المنتصف
//               //   overflow: TextOverflow.ellipsis,  // ← إضافة ... إذا كان النص طويل
//               //   maxLines: 2,                      // ← السماح بسطرين كحد أقصى
//               // )
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
//                         onPressed: () {
//                           Navigator.pushNamed(
//                             context,
//                             Routes.forgotPasswordRoute,
//                           );
//                         },
//                         child: Text(
//                           AppStrings.ForgetPassword,
//                           style: Theme.of(context).textTheme.titleMedium,
//                           textAlign: TextAlign.center,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 2,
//                         ).tr(),
//                       ),
//                     ),
//                     const SizedBox(width: AppSize.s8),
//                     Flexible(
//                       child: TextButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, Routes.registerRoute);
//                         },
//                         child: Text(
//                           AppStrings.registerText,
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
