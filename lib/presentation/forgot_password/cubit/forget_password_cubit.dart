import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvmclean/app/function.dart';
import 'package:mvvmclean/domain/usecase/forget_password_usecase.dart';
import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer.dart';
import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
import 'package:mvvmclean/presentation/forgot_password/cubit/forget_pssword_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUsecase forgetPasswordUsecase;
  ForgetPasswordCubit(this.forgetPasswordUsecase)
    : super(ForgetPasswordState());

  bool _isEmailValid(String email) {
    return isEmailValid(email);
  }

  bool _areAllInputsValid(String email) {
    return _isEmailValid(email);
  }

  void setEmail(String email) {
    final newState = state.copyWith(
      email: email,
      forgetPasswordSuccess: false,
      isEmailValid: _isEmailValid(email),
      isAllInputsValid: _areAllInputsValid(email),
    );

    emit(
      newState.copyWith(
        email: newState.email,
        forgetPasswordSuccess: false,
        isEmailValid: newState.isEmailValid,
        isAllInputsValid: newState.isAllInputsValid,
      ),
    );
  }

  void resetPassword() async {
    //  implement resetPassword
    //  implement login
    emit(
      state.copyWith(
        flowState: LoadingState(
          stateRendererType: StateRendererType.popupLoadingState,
        ),
      ),
    );
    (await forgetPasswordUsecase.execute(
      ForgotPasswordUsecaseInput(state.email),
    )).fold(
      (failure) => {
        // left -> failure
        emit(
          state.copyWith(
            flowState: ErrorState(
              StateRendererType.popupErrorStatete,
              failure.message,
            ),
          ),
        ),
        // ignore: avoid_print
        print(failure.message),
      },
      (response) => {
        // right -> data (success)
        emit(
          state.copyWith(
            flowState: SuccessState(
              StateRendererType.successScreenState,
              response.support.toString(),
            ),
          ),
        ),
        //  isUserResetPasswordSuccessfullyStreamController.add(true),
        // developer.log(response.support.toString() as num),
      },
    );
  }
}
