import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvmclean/app/di.dart';
import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
import 'package:mvvmclean/presentation/forgot_password/cubit/forget_password_cubit.dart';
import 'package:mvvmclean/presentation/forgot_password/cubit/forget_pssword_state.dart';
import 'package:mvvmclean/presentation/resources/assets_manger.dart';
import 'package:mvvmclean/presentation/resources/color_manger.dart';
import 'package:mvvmclean/presentation/resources/strings_manger.dart';
import 'package:mvvmclean/presentation/resources/value_manger.dart';

class ForgetPasswordViewCubit extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ignore: prefer_const_constructors_in_immutables
  ForgetPasswordViewCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<ForgetPasswordCubit>(),
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManger.white,
            body: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
              builder: (context, state) {
                return state.flowState?.getScreenWidget(
                      context,
                      _getContentWidget(context),
                      () {
                        context.read<ForgetPasswordCubit>().resetPassword();
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
              Center(child: Image.asset(ImageAssets.splashLogo)),
              const SizedBox(height: AppSize.s28),

              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                  builder: (context, state) {
                    return TextFormField(
                      style: Theme.of(context).textTheme.titleMedium,
                      onChanged: (value) {
                        context.read<ForgetPasswordCubit>().setEmail(value);
                      },
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: AppStrings.userName.tr(),
                        labelText: AppStrings.userName.tr(),
                        errorText: (state.isEmailValid)
                            ? null
                            : AppStrings.invalidEmail.tr(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: AppSize.s60),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: (state.isAllInputsValid)
                            ? () {
                                context
                                    .read<ForgetPasswordCubit>()
                                    .resetPassword();
                              }
                            : null,
                        child: Text(AppStrings.resetPassword.tr()),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.resendEmail.tr(),
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSize.s8),
                    Flexible(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.resendEmailSubtitle,
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
