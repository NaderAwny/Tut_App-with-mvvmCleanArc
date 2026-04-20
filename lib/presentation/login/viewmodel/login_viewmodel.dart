// // ignore_for_file: strict_top_level_inference

// import 'dart:async';
// import 'package:mvvmclean/domain/usecase/login_usecase.dart';
// import 'package:mvvmclean/presentation/base/baseviewmodel.dart';
// import 'package:mvvmclean/presentation/common/freezed/freezed_data_classes.dart';
// import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer.dart';
// import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';

// class LoginViewModel extends BaseViewModel
//     implements LoginViewModelInputs, LoginViewModelOutputs {
//   final StreamController _userNameStreamController =
//       StreamController<String>.broadcast();
//   final StreamController _passwordStreamController =
//       StreamController<String>.broadcast();

//   final StreamController _areAllInputsValidStreamController =
//       StreamController<void>.broadcast();

//   final StreamController isUserLoggedInSuccessfullyStreamController =
//       StreamController<bool>();

//   var loginObject = LoginObject('', '');
//   final LoginUsecase _loginUsecase;
//   LoginViewModel(this._loginUsecase);

//   // inputs
//   @override
//   void dispose() {
//     super.dispose();
//     _userNameStreamController.close();
//     _passwordStreamController.close();
//     _areAllInputsValidStreamController.close();
//     isUserLoggedInSuccessfullyStreamController.close();
//   }

//   @override
//   void start() {
//     // view model should tell view please show content state
//     //if is called from login screen Api show loading state
//     inputState.add(ContentState());
//   }

//   @override
//   Sink get inputPassword => _passwordStreamController.sink;

//   @override
//   Sink get inputUserName => _userNameStreamController.sink;
//   @override
//   //  implement inputAllAreValid
//   Sink get inputAllAreValid => _areAllInputsValidStreamController.sink;

//   @override
//   setUserName(String userName) {
//     inputUserName.add(userName);
//     loginObject = loginObject.copyWith(userName: userName);
//     inputAllAreValid.add(null);
//   }

//   @override
//   setPassword(String password) {
//     inputPassword.add(password);
//     loginObject = loginObject.copyWith(password: password);
//     inputAllAreValid.add(null);
//   }

//   @override
//   login() async {
//     //  implement login
//     inputState.add(
//       LoadingState(stateRendererType: StateRendererType.popupLoadingState),
//     );

//     (await _loginUsecase.execute(
//       LoginUsecaseInput(loginObject.userName, loginObject.password),
//     )).fold(
//       (failure) => {
//         // left -> failure
//         inputState.add(
//           ErrorState(StateRendererType.popupErrorStatete, failure.message),
//         ),
//         // ignore: avoid_print
//         print(failure.message),
//       },
//       (data) => {
//         // right -> data (success)
//         // ignore: avoid_print
//         // print(data.customer?.name),
//         inputState.add(ContentState()),
//         // navigate to main screen
//         isUserLoggedInSuccessfullyStreamController.add(true),
//       },
//     );
//   }

//   // outputs
//   @override
//   Stream<bool> get outIsPasswordValid => _passwordStreamController.stream.map(
//     (password) => _isPasswordValid(password),
//   );

//   @override
//   Stream<bool> get outIsUserNameValid => _userNameStreamController.stream.map(
//     (userName) => _isUserNameValid(userName),
//   );
//   @override
//   // implement outAreAllInputsValid
//   Stream<bool> get outAreAllInputsValid => _areAllInputsValidStreamController
//       .stream
//       .map((_) => _areAllInputsValid(loginObject));
// }

// // private methods

// bool _areAllInputsValid(dynamic loginObject) {
//   return _isPasswordValid(loginObject.password) &&
//       _isUserNameValid(loginObject.userName);
// }

// bool _isPasswordValid(String password) {
//   return password.isNotEmpty;
// }

// bool _isUserNameValid(String userName) {
//   return userName.isNotEmpty;
// }

// abstract class LoginViewModelInputs {
//   setUserName(String userName);

//   setPassword(String password);

//   login();

//   Sink get inputUserName;

//   Sink get inputPassword;

//   Sink get inputAllAreValid;
// }

// abstract class LoginViewModelOutputs {
//   Stream<bool> get outIsUserNameValid;
//   Stream<bool> get outIsPasswordValid;
//   Stream<bool> get outAreAllInputsValid;
// }
