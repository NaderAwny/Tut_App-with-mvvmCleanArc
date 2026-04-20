// import 'dart:async';

// import 'dart:developer' as developer;
// import 'package:mvvmclean/app/function.dart';
// import 'package:mvvmclean/domain/usecase/forget_password_usecase.dart';
// import 'package:mvvmclean/presentation/base/baseviewmodel.dart';
// import 'package:mvvmclean/presentation/common/freezed/freezed_data_classes.dart';
// import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer.dart';
// import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';

// class ForgetPasswordViewModel extends BaseViewModel
//     implements ForgetPasswordViewModelInputs, ForgetPasswordViewModelOutputs {
//   final StreamController emailStreamController =
//       StreamController<String>.broadcast();
//   final StreamController areAllInputsValidStreamController =
//       StreamController<void>.broadcast();
//   // final StreamController<bool> isUserResetPasswordSuccessfullyStreamController =
//   //     StreamController<bool>.broadcast();

//   var forgetPasswordObject = ForgetPasswordObject('');
//   final ForgetPasswordUsecase forgetPasswordUsecase;
//   ForgetPasswordViewModel(this.forgetPasswordUsecase);
//   @override
//   void start() {
//     // implement start
//     inputState.add(ContentState());
//   }

//   @override
//   void dispose() {
//     emailStreamController.close();
//     areAllInputsValidStreamController.close();
//   }

//   @override
//   //  implement inputEmail
//   Sink get inputEmail => emailStreamController.sink;

//   @override
//   //  implement isuserallvalid
//   Sink get isuserallvalid => areAllInputsValidStreamController.sink;

//   @override
//   // implement outAreAllInputsValid
//   Stream<bool> get outAreAllInputsValid => areAllInputsValidStreamController
//       .stream
//       .map((_) => _areAllInputsValid(forgetPasswordObject));

//   @override
//   // implement outIsEmailValid
//   Stream<bool> get outIsEmailValid =>
//       emailStreamController.stream.map((email) => _isEmailValid(email));

//   // bool _isEmailValid(String email) {
//   //   return email.isNotEmpty;
//   // }
//   // ignore: strict_top_level_inference
//   _isEmailValid(String email) {
//     return isEmailValid(email);
//   }

//   // ignore: strict_top_level_inference
//   _areAllInputsValid(ForgetPasswordObject forgetPasswordObject) {
//     return _isEmailValid(forgetPasswordObject.email);
//   }

//   @override
//   resetPassword() async {
//     //  implement resetPassword
//     //  implement login
//     inputState.add(
//       LoadingState(stateRendererType: StateRendererType.popupLoadingState),
//     );
//     (await forgetPasswordUsecase.execute(
//       ForgotPasswordUsecaseInput(forgetPasswordObject.email),
//     )).fold(
//       (failure) => {
//         // left -> failure
//         inputState.add(
//           ErrorState(StateRendererType.popupErrorStatete, failure.message),
//         ),
//         // ignore: avoid_print
//         print(failure.message),
//       },
//       (response) => {
//         // right -> data (success)
//         inputState.add(
//           SuccessState(
//             StateRendererType.successScreenState,
//             response.support.toString(),
//           ),
//         ),
//         //  isUserResetPasswordSuccessfullyStreamController.add(true),
//         developer.log(response.support.toString()),
//       },
//     );
//   }

//   @override
//   setEmail(String email) {
//     //  implement setEmail
//     inputEmail.add(email);
//     forgetPasswordObject = forgetPasswordObject.copyWith(email: email);
//     isuserallvalid.add(null);
//   }
// }

// // Stream<bool> get outIsUserResetPasswordSuccessfully =>
// //     isUserResetPasswordSuccessfullyStreamController.stream;
// abstract class ForgetPasswordViewModelInputs {
//   // ignore: strict_top_level_inference
//   setEmail(String email);
//   // ignore: strict_top_level_inference
//   resetPassword();
//   Sink get inputEmail;
//   Sink get isuserallvalid;
// }

// abstract class ForgetPasswordViewModelOutputs {
//   Stream<bool> get outIsEmailValid;
//   Stream<bool> get outAreAllInputsValid;
//   // Stream<bool> get outIsUserResetPasswordSuccessfully;
// }
