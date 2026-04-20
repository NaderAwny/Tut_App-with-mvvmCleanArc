import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvmclean/app/app_prefs.dart';
import 'package:mvvmclean/app/di.dart';
import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
import 'package:mvvmclean/presentation/login/cubit/login_cubit.dart';
import 'package:mvvmclean/presentation/login/cubit/login_state.dart';
import 'package:mvvmclean/presentation/resources/assets_manger.dart';
import 'package:mvvmclean/presentation/resources/color_manger.dart';
import 'package:mvvmclean/presentation/resources/route_manger.dart';
import 'package:mvvmclean/presentation/resources/strings_manger.dart';
import 'package:mvvmclean/presentation/resources/value_manger.dart';

class LoginCubitView extends StatelessWidget {
  LoginCubitView({super.key});
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            _appPreferences.setLoggedInStatus();
            Navigator.pushReplacementNamed(context, Routes.mainRoute);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManger.white,
            body: BlocBuilder<LoginCubit, LoginState>(
              //outputState is straem from basedviewmodel view th content state

              // builder: (context, snapshot) {
              //   return snapshot.data?.getScreenWidget(
              //         context,
              //         _getContentWidget(),
              //         () {
              //           _viewModel.login();
              //         },
              //       ) ??
              //       _getContentWidget();
              builder: (context, state) {
                return state.flowState?.getScreenWidget(
                      context,
                      _getContentWidget(context),
                      () {
                        context.read<LoginCubit>().login();
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
      padding: const EdgeInsets.only(top: AppPadding.p100),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Center(
                child: Image(image: AssetImage(ImageAssets.splashLogo)),
              ),
              const SizedBox(height: AppSize.s28),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return TextFormField(
                      style: Theme.of(context).textTheme.titleMedium,
                      controller: _userNameController,
                      onChanged: (value) {
                        context.read<LoginCubit>().setUserName(value);
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: AppStrings.email.tr(),
                        labelText: AppStrings.email.tr(),
                        errorText: (state.isUserNameValid)
                            ? null
                            : AppStrings.invalidEmail.tr(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSize.s28),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return TextFormField(
                      style: Theme.of(context).textTheme.titleMedium,
                      controller: _passwordController,
                      onChanged: (value) {
                        context.read<LoginCubit>().setPassword(value);
                      },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: AppStrings.password.tr(),
                        labelText: AppStrings.password.tr(),
                        errorText: (state.isPasswordValid)
                            ? null
                            : AppStrings.passwordInvalid.tr(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSize.s28),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: (state.isAllInputsValid)
                            ? () => context.read<LoginCubit>().login()
                            : null,
                        child: Text(AppStrings.login.tr()),
                      ),
                    );
                  },
                ),
              ),

              // Text(
              //   AppStrings.ForgetPassword,
              //   style: Theme.of(context).textTheme.titleMedium,
              //   textAlign: TextAlign.center,      // ← محاذاة في المنتصف
              //   overflow: TextOverflow.ellipsis,  // ← إضافة ... إذا كان النص طويل
              //   maxLines: 2,                      // ← السماح بسطرين كحد أقصى
              // )
              Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p28,
                  left: AppPadding.p22,
                  right: AppPadding.p22,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Routes.forgotPasswordRoute,
                          );
                        },
                        child: Text(
                          AppStrings.ForgetPassword,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ).tr(),
                      ),
                    ),
                    const SizedBox(width: AppSize.s8),
                    Flexible(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.registerRoute);
                        },
                        child: Text(
                          AppStrings.registerText,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ).tr(),
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
}
