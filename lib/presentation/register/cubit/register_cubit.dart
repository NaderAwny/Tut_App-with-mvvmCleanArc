// void setXXX(Type value) {
//   // 1️⃣ احسب validation
//   final isValid = validateXXX(value);

//   // 2️⃣ اعمل state جديد بالقيمة الجديدة
//   final newState = state.copyWith(
//     xxx: value,
//     isXXXValid: isValid,
//     registerSuccess: false,
//   );

//   // 3️⃣ احسب هل كل الفورم valid ولا لأ
//   final allValid = validateAllInputs(
//     newState.userName,
//     newState.password,
//     newState.email,
//     newState.mobile,
//     newState.countryCode,
//   );

//   // 4️⃣ اعمل emit
//   emit(newState.copyWith(
//     isAllValid: allValid,
//   ));
// }

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvmclean/app/function.dart';

import 'package:mvvmclean/domain/usecase/register_usecse.dart';
import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer.dart';
import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
import 'package:mvvmclean/presentation/register/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase _registerUseCase;
  RegisterCubit(this._registerUseCase) : super(RegisterState());

  // ignore: non_constant_identifier_names
  void Register() async {
    emit(
      state.copyWith(
        flowState: LoadingState(
          stateRendererType: StateRendererType.popupLoadingState,
        ),
      ),
    );

    (await _registerUseCase.execute(
      RegisterUsecaseInput(
        state.userName,
        state.countryCode,
        state.mobile,
        state.email,
        state.password,
        state.profilePicture?.path ?? "",
      ),
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
        emit(RegisterSuccessState()),
        // navigate to main screen
      },
    );
  }

  void setCountryMobileCode(String countryMobileCode) {
    //  implement setCountryMobileCode
    if (countryMobileCode.isNotEmpty) {
      //  update register view objec
      emit(
        state.copyWith(
          countryCode: countryMobileCode,
          registerSuccess: false,
          isAllValid: validateAllInputs(
            state.userName,
            state.password,
            state.email,
            state.mobile,
            state.countryCode,
          ),
        ),
      );
    } else {
      // reset country mobile code value in register view object
      emit(state.copyWith(countryCode: ""));
    }
  }

  bool isEmailValided(String email) {
    return isEmailValid(email);
  }

  void setEmail(String email) {
    //  implement setEmail
    final valid = isEmailValided(email);
    final newState = state.copyWith(
      email: email,
      isEmailValid: valid,
      registerSuccess: false,
    );
    //  update register view object
    emit(
      newState.copyWith(
        email: email,
        registerSuccess: false,
        isEmailValid: isEmailValided(email),
        isAllValid: validateAllInputs(
          newState.userName,
          newState.password,
          newState.email,
          newState.mobile,
          newState.countryCode,
        ),
      ),
    );
  }

  bool _isMobilNumberValid(String mobilnumber) {
    return mobilnumber.length >= 10;
  }

  void setMobile(String mobile) {
    //  implement setMobile
    final valid = _isMobilNumberValid(mobile);
    final newState = state.copyWith(
      mobile: mobile,
      isMobileValid: valid,
      registerSuccess: false,
    );
    //  update register view object
    emit(
      newState.copyWith(
        mobile: mobile,
        registerSuccess: false,
        isMobileValid: _isMobilNumberValid(mobile),
        isAllValid: validateAllInputs(
          newState.userName,
          newState.password,
          newState.email,
          newState.mobile,
          newState.countryCode,
        ),
      ),
    );
  }

  bool _isUserNameValid(String username) {
    return username.length >= 8;
  }

  void setUserName(String username) {
    //  implement setUserName
    final valid = _isUserNameValid(username);
    final newState = state.copyWith(
      userName: username,
      isUserNameValid: valid,
      registerSuccess: false,
    );
    //  update register view object
    emit(
      newState.copyWith(
        userName: username,
        registerSuccess: false,
        isUserNameValid: _isUserNameValid(username),
        isAllValid: validateAllInputs(
          newState.userName,
          newState.password,
          newState.email,
          newState.mobile,
          newState.countryCode,
        ),
      ),
    );
  }

  bool _isPasswordValid(String password) {
    return password.length >= 8;
  }

  void setPassword(String password) {
    //  implement setPassword
    final valid = _isPasswordValid(password);
    final newState = state.copyWith(
      password: password,
      isPasswordValid: valid,
      registerSuccess: false,
    );
    //  update register view object
    emit(
      newState.copyWith(
        password: password,
        registerSuccess: false,
        isPasswordValid: _isPasswordValid(password),
        isAllValid: validateAllInputs(
          newState.userName,
          newState.password,
          newState.email,
          newState.mobile,
          newState.countryCode,
        ),
      ),
    );
  }

  void setProfilePicture(File profilePicture) {
    //  implement setProfilePicture
    final valid = profilePicture.path.isNotEmpty;
    final newState = state.copyWith(
      profilePicture: profilePicture,
      isAllValid: valid,
      registerSuccess: false,
    );
    //  update register view object
    emit(
      newState.copyWith(
        profilePicture: profilePicture,
        registerSuccess: false,
        isAllValid: validateAllInputs(
          newState.userName,
          newState.password,
          newState.email,
          newState.mobile,
          newState.countryCode,
        ),
      ),
    );
  }

  bool validateAllInputs(
    String userName,
    String password,
    String email,
    String mobile,
    String countryCode,
  ) {
    return _isPasswordValid(password) &&
        _isMobilNumberValid(mobile) &&
        isEmailValided(email) &&
        _isUserNameValid(userName) &&
        countryCode.isNotEmpty;
  }
}
