import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';

class ForgetPasswordState {
  FlowState? flowState;
  final String email;
  final bool isEmailValid;
  final bool isAllInputsValid;

  ForgetPasswordState({
    this.flowState,
    this.email = "",
    this.isEmailValid = true,
    this.isAllInputsValid = false,
  });

  ForgetPasswordState copyWith({
    FlowState? flowState,
    String? email,
    bool? isEmailValid,
    bool? isAllInputsValid,
    bool? forgetPasswordSuccess,
  }) {
    return ForgetPasswordState(
      flowState: flowState ?? this.flowState,
      email: email ?? this.email,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isAllInputsValid: isAllInputsValid ?? this.isAllInputsValid,
    );
  }
}

class ForgetPasswordSuccessState extends ForgetPasswordState {}
