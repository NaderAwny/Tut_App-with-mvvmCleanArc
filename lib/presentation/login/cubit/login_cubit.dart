import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvmclean/app/function.dart';
import 'package:mvvmclean/domain/usecase/login_usecase.dart';
import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer.dart';
import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
import 'package:mvvmclean/presentation/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase _loginUseCase;
  LoginCubit(this._loginUseCase) : super(LoginState());
  // ignore: strict_top_level_inference
  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  bool _isUserNameValid(String userName) {
    return isEmailValid(userName);
  }

  bool _isPasswordValid(String password) {
    return password.length >= 8;
  }

  bool _areAllInputsValid(String userName, String password) {
    return _isPasswordValid(password) && _isUserNameValid(userName);
  }

  // ignore: strict_top_level_inference
  setUserName(String userName) {
    final newState = state.copyWith(
      userName: userName,
      //loginSuccess: false,
      isUserNameValid: _isUserNameValid(userName),
      isAllInputsValid: _areAllInputsValid(userName, state.password),
    );

    emit(
      newState.copyWith(
        userName: newState.userName,
        //loginSuccess: false,
        isUserNameValid: newState.isUserNameValid,
        isAllInputsValid: newState.isAllInputsValid,
      ),
    );
  }

  // ignore: strict_top_level_inference
  setPassword(String password) {
    final newState = state.copyWith(
      password: password,
      //loginSuccess: false,
      isPasswordValid: _isPasswordValid(password),
      isAllInputsValid: _areAllInputsValid(state.userName, password),
    );
    emit(
      newState.copyWith(
        password: newState.password,
        //loginSuccess: false,
        isPasswordValid: newState.isPasswordValid,
        isAllInputsValid: newState.isAllInputsValid,
      ),
    );
  }

  // ignore: strict_top_level_inference
  login() async {
    emit(
      state.copyWith(
        flowState: LoadingState(
          stateRendererType: StateRendererType.popupLoadingState,
        ),
      ),
    );

    (await _loginUseCase.execute(
      LoginUsecaseInput(state.userName, state.password),
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
      (data) => {
        // right -> data (success)
        // ignore: avoid_print
        // print(data.customer?.name),
        emit(state.copyWith(flowState: ContentState())),
        emit(LoginSuccessState()),
        // navigate to main screen
      },
    );
    //   }
  }
}
