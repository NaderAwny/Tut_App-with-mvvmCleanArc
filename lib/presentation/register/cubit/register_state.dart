import 'dart:io';

import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';

class RegisterState {
  final String userName;
  final String email;
  final String password;
  final String mobile;
  final String countryCode;
  final File? profilePicture;

  final bool isUserNameValid;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isMobileValid;

  final bool isAllValid;

  final FlowState? flowState; // loading - error - content

  const RegisterState({
    this.userName = "",
    this.email = "",
    this.password = "",
    this.mobile = "",
    this.countryCode = "",
    this.profilePicture,
    this.isUserNameValid = true,
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.isMobileValid = true,
    this.isAllValid = false,
    this.flowState,
  });

  RegisterState copyWith({
    String? userName,
    String? email,
    String? password,
    String? mobile,
    String? countryCode,
    File? profilePicture,
    bool? isUserNameValid,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isMobileValid,
    bool? isAllValid,
    FlowState? flowState,
    bool? registerSuccess,
  }) {
    return RegisterState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      mobile: mobile ?? this.mobile,
      countryCode: countryCode ?? this.countryCode,
      profilePicture: profilePicture ?? this.profilePicture,
      isUserNameValid: isUserNameValid ?? this.isUserNameValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isMobileValid: isMobileValid ?? this.isMobileValid,
      isAllValid: isAllValid ?? this.isAllValid,
      flowState: flowState ?? this.flowState,
    );
  }
}

class RegisterSuccessState extends RegisterState {}
