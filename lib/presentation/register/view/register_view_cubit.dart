import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvvmclean/app/app_prefs.dart';
import 'package:mvvmclean/app/constants.dart';
import 'package:mvvmclean/app/di.dart';
import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
import 'package:mvvmclean/presentation/register/cubit/register_cubit.dart';
import 'package:mvvmclean/presentation/register/cubit/register_state.dart';
import 'package:mvvmclean/presentation/resources/assets_manger.dart';
import 'package:mvvmclean/presentation/resources/color_manger.dart';
import 'package:mvvmclean/presentation/resources/font_manger.dart';
import 'package:mvvmclean/presentation/resources/route_manger.dart';
import 'package:mvvmclean/presentation/resources/strings_manger.dart';
import 'package:mvvmclean/presentation/resources/styles_mangers.dart';
import 'package:mvvmclean/presentation/resources/value_manger.dart';

class RegisterViewCubit extends StatelessWidget {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final ImagePicker _imagePicker = instance<ImagePicker>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterViewCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            _appPreferences.setLoggedInStatus();
            Navigator.pushReplacementNamed(context, Routes.mainRoute);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManger.white,
            appBar: AppBar(
              shadowColor: Colors.transparent,
              elevation: AppSize.s0,
              scrolledUnderElevation: AppSize.s0,
              backgroundColor: ColorManger.white,
              surfaceTintColor: Colors.transparent,
              iconTheme: IconThemeData(color: ColorManger.primary),
            ),

            // body بتاع الصفحة
            body: BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return state.flowState?.getScreenWidget(
                      context,

                      _getContentWidget(context),

                      () {
                        context.read<RegisterCubit>().Register();
                      },
                    ) ??
                    _getContentWidget(context);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _getContentWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: AppPadding.p28),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: const Image(image: AssetImage(ImageAssets.splashLogo)),
              ),
              const SizedBox(height: AppSize.s18),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return TextFormField(
                      style: Theme.of(context).textTheme.titleMedium,
                      controller: _userNameController,
                      onChanged: (value) {
                        context.read<RegisterCubit>().setUserName(value);
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: AppStrings.userName.tr(),
                        labelText: AppStrings.userName.tr(),
                        errorText: state.isUserNameValid
                            ? null
                            : AppStrings.userNameInvalid.tr(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSize.s18),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CountryCodePicker(
                          onChanged: (country) {
                            context.read<RegisterCubit>().setCountryMobileCode(
                              country.dialCode ?? Constants.token,
                              // country.code ?? Constants.token,
                            );
                          },
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: '+20',
                          favorite: ['+39', 'FR', '+966'],
                          // optional. Shows only country name and flag
                          showCountryOnly: true,
                          // optional. Shows only country name and flag when popup is closed.
                          hideMainText: true,
                          // optional. aligns the flag and the Text left
                          showOnlyCountryWhenClosed: true,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (context, state) {
                            return TextFormField(
                              style: Theme.of(context).textTheme.titleMedium,
                              controller: _mobileNumberController,
                              onChanged: (value) {
                                context.read<RegisterCubit>().setMobile(value);
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: AppStrings.mobileNumber.tr(),
                                labelText: AppStrings.mobileNumber.tr(),
                                errorText: state.isMobileValid
                                    ? null
                                    : AppStrings.mobileNumberInvalid.tr(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s18),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return TextFormField(
                      style: Theme.of(context).textTheme.titleMedium,
                      controller: _emailController,
                      onChanged: (value) {
                        context.read<RegisterCubit>().setEmail(value);
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: AppStrings.email.tr(),
                        labelText: AppStrings.email.tr(),
                        errorText: state.isEmailValid
                            ? null
                            : AppStrings.invalidEmail.tr(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSize.s18),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return TextFormField(
                      style: Theme.of(context).textTheme.titleMedium,
                      controller: _passwordController,
                      onChanged: (value) {
                        context.read<RegisterCubit>().setPassword(value);
                      },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: AppStrings.password.tr(),
                        labelText: AppStrings.password.tr(),
                        errorText: state.isPasswordValid
                            ? null
                            : AppStrings.passwordInvalid.tr(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSize.s18),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s8),
                    border: Border.all(color: ColorManger.lightGrey),
                  ),

                  height: AppSize.s40,
                  child: GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: _getMediaWidget(),
                  ),
                ),
              ),

              const SizedBox(height: AppSize.s40),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: (state.isAllValid)
                            ? () => context.read<RegisterCubit>().Register()
                            : null,
                        child: Text(AppStrings.register.tr()),
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p28,
                  left: AppPadding.p22,
                  right: AppPadding.p22,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          AppStrings.alreadyHaveAccount.tr(),
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getMediaWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p8, right: AppPadding.p8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              AppStrings.profilePicture,
              style: getRegularStyle(
                color: ColorManger.grey,
                fontSize: FontSize.s14,
              ),
            ).tr(),
          ),
          Flexible(
            child: BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return _imagePicketByUser(state.profilePicture);
              },
            ),
          ),

          Flexible(child: SvgPicture.asset(ImageAssets.photoCameraIc)),
        ],
      ),
    );
  }

  Widget _imagePicketByUser(File? file) {
    if (file != null && file.path.isNotEmpty) {
      return Image.file(file, fit: BoxFit.cover);
    } else {
      return Container();
    }
  }

  // ignore: strict_top_level_inference
  _showPicker(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.photo_library),
                title: Text(AppStrings.photoGallery.tr()),
                onTap: () {
                  _imageFromGallery(cubit);
                  Navigator.of(ctx).pop();
                },
              ),
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.camera_alt_outlined),
                title: Text(AppStrings.photoCamera.tr()),
                onTap: () {
                  _imageFromCamera(cubit);
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // ignore: strict_top_level_inference
  _imageFromGallery(RegisterCubit cubit) async {
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    // ignore: use_build_context_synchronously
    cubit.setProfilePicture(File(image?.path ?? ""));
  }

  // ignore: strict_top_level_inference
  _imageFromCamera(RegisterCubit cubit) async {
    var image = await _imagePicker.pickImage(source: ImageSource.camera);
    // ignore: use_build_context_synchronously
    cubit.setProfilePicture(File(image?.path ?? ""));
  }
}
