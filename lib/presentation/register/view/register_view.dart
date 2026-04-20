// import 'dart:io';

// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mvvmclean/app/app_prefs.dart';
// import 'package:mvvmclean/app/constants.dart';
// import 'package:mvvmclean/app/di.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
// import 'package:mvvmclean/presentation/register/viewmodel/register_viewmodel.dart';
// import 'package:mvvmclean/presentation/resources/assets_manger.dart';
// import 'package:mvvmclean/presentation/resources/color_manger.dart';
// import 'package:mvvmclean/presentation/resources/font_manger.dart';
// import 'package:mvvmclean/presentation/resources/route_manger.dart';
// import 'package:mvvmclean/presentation/resources/strings_manger.dart';
// import 'package:mvvmclean/presentation/resources/styles_mangers.dart';
// import 'package:mvvmclean/presentation/resources/value_manger.dart';

// class RegisterView extends StatefulWidget {
//   const RegisterView({super.key});

//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
//   final RegisterViewModel _viewModel = instance<RegisterViewModel>();
//   final AppPreferences _appPreferences = instance<AppPreferences>();
//   final ImagePicker _imagePicker = instance<ImagePicker>();
//   final TextEditingController _userNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _mobileNumberController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   // ignore: strict_top_level_inference, unused_element
//   _bind() {
//     _viewModel.start();
//     //  عشان اول لما userيغير فى  حاجه يكون فيه فيهlistener يسمع فى الشاشه
//     _userNameController.addListener(
//       () => _viewModel.setUserName(_userNameController.text),
//     );
//     _emailController.addListener(
//       () => _viewModel.setEmail(_emailController.text),
//     );
//     _passwordController.addListener(
//       () => _viewModel.setPassword(_passwordController.text),
//     );
//     _mobileNumberController.addListener(
//       () => _viewModel.setMobile(_mobileNumberController.text),
//     );
//     _viewModel.isUserRegisterSuccessfullyStreamController.stream.listen((
//       isRegister,
//     ) {
//       if (isRegister) {
//         SchedulerBinding.instance.addPostFrameCallback((_) {
//           _appPreferences.setLoggedInStatus();
//           Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
//         });
//       }
//     });
//   }

//   @override
//   void initState() {
//     _bind();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManger.white,
//       appBar: AppBar(
//         shadowColor: Colors.transparent,
//         elevation: AppSize.s0,
//         scrolledUnderElevation: AppSize.s0,
//         backgroundColor: ColorManger.white,
//         surfaceTintColor: Colors.transparent,
//         iconTheme: IconThemeData(color: ColorManger.primary),
//       ),

//       // body بتاع الصفحة
//       body: StreamBuilder<FlowState>(
//         // هنا بنحدد الـ stream اللي الشاشة هتسمع له
//         // الـ stream ده جاي من الـ ViewModel وبيبعت حالات الشاشة
//         // زي Loading / Error / Content / Success
//         stream: _viewModel.outputState,

//         // الـ builder ده بيتنفذ كل مرة الـ stream يبعت state جديدة
//         builder: (context, snapshot) {
//           // snapshot فيه آخر data وصلت من الـ stream
//           // snapshot.data هي الحالة الحالية للشاشة (FlowState)

//           return snapshot.data?.getScreenWidget(
//                 // context بتاع الصفحة
//                 // بيستخدم لو عايزين نفتح Dialog أو Popup
//                 context,

//                 // ده ال widget الأساسي بتاع الشاشة
//                 // يعني الفورم بتاع التسجيل (TextFields + Buttons)
//                 _getContentWidget(),

//                 // دي function بتتنفذ لو حصل Error
//                 // مثلا يظهر زرار Retry
//                 // لما المستخدم يضغطه يعمل Register تاني
//                 () {
//                   _viewModel.Register();
//                 },
//               )
//               // لو snapshot.data = null
//               // يعني مفيش state وصلت لسه من الـ stream
//               // نعرض الشاشة العادية
//               ??
//               _getContentWidget();
//         },
//       ),
//     );
//   }

//   Widget _getContentWidget() {
//     return Container(
//       padding: EdgeInsets.only(top: AppPadding.p28),
//       child: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Center(
//                 child: const Image(image: AssetImage(ImageAssets.splashLogo)),
//               ),
//               const SizedBox(height: AppSize.s18),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: AppPadding.p28,
//                   right: AppPadding.p28,
//                 ),
//                 child: StreamBuilder<String?>(
//                   stream: _viewModel.UserNameErrorOutput,
//                   builder: (context, snapshot) {
//                     return TextFormField(
//                       style: Theme.of(context).textTheme.titleMedium,
//                       controller: _userNameController,
//                       keyboardType: TextInputType.name,
//                       decoration: InputDecoration(
//                         hintText: AppStrings.userName.tr(),
//                         labelText: AppStrings.userName.tr(),
//                         errorText: snapshot.data,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: AppSize.s18),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                     left: AppPadding.p28,
//                     right: AppPadding.p28,
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: CountryCodePicker(
//                           onChanged: (country) {
//                             _viewModel.setCountryMobileCode(
//                               country.dialCode ?? Constants.token,
//                               // country.code ?? Constants.token,
//                             );
//                           },
//                           // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//                           initialSelection: '+20',
//                           favorite: ['+39', 'FR', '+966'],
//                           // optional. Shows only country name and flag
//                           showCountryOnly: true,
//                           // optional. Shows only country name and flag when popup is closed.
//                           hideMainText: true,
//                           // optional. aligns the flag and the Text left
//                           showOnlyCountryWhenClosed: true,
//                         ),
//                       ),
//                       Expanded(
//                         flex: 4,
//                         child: StreamBuilder<String?>(
//                           stream: _viewModel.MobileErrorOutput,
//                           builder: (context, snapshot) {
//                             return TextFormField(
//                               style: Theme.of(context).textTheme.titleMedium,
//                               controller: _mobileNumberController,
//                               keyboardType: TextInputType.phone,
//                               decoration: InputDecoration(
//                                 hintText: AppStrings.mobileNumber.tr(),
//                                 labelText: AppStrings.mobileNumber.tr(),
//                                 errorText: snapshot.data,
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: AppSize.s18),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: AppPadding.p28,
//                   right: AppPadding.p28,
//                 ),
//                 child: StreamBuilder<String?>(
//                   stream: _viewModel.EmailErrorOutput,
//                   builder: (context, snapshot) {
//                     return TextFormField(
//                       style: Theme.of(context).textTheme.titleMedium,
//                       controller: _emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         hintText: AppStrings.email.tr(),
//                         labelText: AppStrings.email.tr(),
//                         errorText: snapshot.data,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: AppSize.s18),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: AppPadding.p28,
//                   right: AppPadding.p28,
//                 ),
//                 child: StreamBuilder<String?>(
//                   stream: _viewModel.PasswordErrorOutput,
//                   builder: (context, snapshot) {
//                     return TextFormField(
//                       style: Theme.of(context).textTheme.titleMedium,
//                       controller: _passwordController,
//                       keyboardType: TextInputType.visiblePassword,
//                       decoration: InputDecoration(
//                         hintText: AppStrings.password.tr(),
//                         labelText: AppStrings.password.tr(),
//                         errorText: snapshot.data,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: AppSize.s18),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: AppPadding.p28,
//                   right: AppPadding.p28,
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(AppSize.s8),
//                     border: Border.all(color: ColorManger.lightGrey),
//                   ),

//                   height: AppSize.s40,
//                   child: GestureDetector(
//                     onTap: () {
//                       _showPicker(context);
//                     },
//                     child: _getMediaWidget(),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: AppSize.s40),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: AppPadding.p28,
//                   right: AppPadding.p28,
//                 ),
//                 child: StreamBuilder<bool>(
//                   stream: _viewModel.AllInputsValidOutput,
//                   builder: (context, snapshot) {
//                     return SizedBox(
//                       width: double.infinity,
//                       height: AppSize.s40,
//                       child: ElevatedButton(
//                         onPressed: (snapshot.data ?? false)
//                             ? () => _viewModel.Register()
//                             : null,
//                         child: Text(AppStrings.register.tr()),
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
//                   children: [
//                     Expanded(
//                       child: TextButton(
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Text(
//                           AppStrings.alreadyHaveAccount.tr(),
//                           style: Theme.of(context).textTheme.titleMedium,
//                           textAlign: TextAlign.center,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 2,
//                         ),
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

//   Widget _getMediaWidget() {
//     return Padding(
//       padding: const EdgeInsets.only(left: AppPadding.p8, right: AppPadding.p8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Flexible(
//             child: Text(
//               AppStrings.profilePicture,
//               style: getRegularStyle(
//                 color: ColorManger.grey,
//                 fontSize: FontSize.s14,
//               ),
//             ).tr(),
//           ),
//           Flexible(
//             child: StreamBuilder<File>(
//               stream: _viewModel.ProfilePictureOutput,
//               builder: (context, snapshot) {
//                 return _imagePicketByUser(snapshot.data);
//               },
//             ),
//           ),

//           Flexible(child: SvgPicture.asset(ImageAssets.photoCameraIc)),
//         ],
//       ),
//     );
//   }

//   Widget _imagePicketByUser(File? file) {
//     if (file != null && file.path.isNotEmpty) {
//       return Image.file(file, fit: BoxFit.cover);
//     } else {
//       return Container();
//     }
//   }

//   // ignore: strict_top_level_inference
//   _showPicker(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Wrap(
//             children: [
//               ListTile(
//                 trailing: const Icon(Icons.arrow_forward),
//                 leading: const Icon(Icons.photo_library),
//                 title: Text(AppStrings.photoGallery.tr()),
//                 onTap: () {
//                   _imageFromGallery();
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 trailing: const Icon(Icons.arrow_forward),
//                 leading: const Icon(Icons.camera_alt_outlined),
//                 title: Text(AppStrings.photoCamera.tr()),
//                 onTap: () {
//                   _imageFromCamera();
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   // ignore: strict_top_level_inference
//   _imageFromGallery() async {
//     var image = await _imagePicker.pickImage(source: ImageSource.gallery);
//     _viewModel.setProfilePicture(File(image?.path ?? ""));
//   }

//   // ignore: strict_top_level_inference
//   _imageFromCamera() async {
//     var image = await _imagePicker.pickImage(source: ImageSource.camera);
//     _viewModel.setProfilePicture(File(image?.path ?? ""));
//   }

//   @override
//   void dispose() {
//     //  implement dispose
//     _viewModel.dispose();
//     super.dispose();
//   }
// }
