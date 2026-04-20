import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';

class LoginState {
  FlowState? flowState;
  final String userName;
  final String password;
  final bool isUserNameValid;
  final bool isPasswordValid;
  final bool isAllInputsValid;
  //final bool loginSuccess;

  LoginState({
    this.flowState,
    this.userName = "",
    this.password = "",
    this.isUserNameValid = true,
    this.isPasswordValid = true,
    this.isAllInputsValid = false,
    // this.loginSuccess = false,
  });

  LoginState copyWith({
    FlowState? flowState,
    String? userName,
    String? password,
    bool? isUserNameValid,
    bool? isPasswordValid,
    bool? isAllInputsValid,
    bool? loginSuccess,
  }) {
    return LoginState(
      flowState: flowState ?? this.flowState,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      isUserNameValid: isUserNameValid ?? this.isUserNameValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isAllInputsValid: isAllInputsValid ?? this.isAllInputsValid,
      //    loginSuccess: loginSuccess ?? this.loginSuccess,
    );
  }
}

class LoginSuccessState extends LoginState {}
