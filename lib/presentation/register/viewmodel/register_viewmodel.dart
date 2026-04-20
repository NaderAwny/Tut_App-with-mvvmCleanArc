// // ignore_for_file: strict_top_level_inference, non_constant_identifier_names

// import 'dart:async';
// import 'dart:io';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:mvvmclean/app/function.dart';
// import 'package:mvvmclean/domain/usecase/register_usecse.dart';
// import 'package:mvvmclean/presentation/base/baseviewmodel.dart';
// import 'package:mvvmclean/presentation/common/freezed/freezed_data_classes.dart';
// import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer.dart';
// import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
// import 'package:mvvmclean/presentation/resources/strings_manger.dart';

// class RegisterViewModel extends BaseViewModel
//     implements RegisterViewModelInput, RegisterViewmodelOutput {
//   final StreamController _UserNameController =
//       StreamController<String>.broadcast();
//   final StreamController _EmailController =
//       StreamController<String>.broadcast();
//   final StreamController _PasswordController =
//       StreamController<String>.broadcast();
//   final StreamController _MobileController =
//       StreamController<String>.broadcast();
//   final StreamController _ProfilePictureController =
//       StreamController<File>.broadcast();
//   final StreamController _AllInputsValidController =
//       StreamController<void>.broadcast();
//   final StreamController isUserRegisterSuccessfullyStreamController =
//       StreamController<bool>();
//   var registerObject = RegisterObject("", "", "", "", "", "");
//   final RegisterUsecase registerUsecase;
//   RegisterViewModel(this.registerUsecase);
//   @override
//   void start() {
//     //  implement start
//     inputState.add(ContentState());
//     //if is view the data call Api wiite funtion call Api
//     //getHomeData()
//   }

//   @override
//   void dispose() {
//     //  implement dispose
//     _UserNameController.close();
//     _EmailController.close();
//     _PasswordController.close();
//     _MobileController.close();
//     _ProfilePictureController.close();
//     _AllInputsValidController.close();
//     isUserRegisterSuccessfullyStreamController.close();
//     super.dispose();
//   }

//   //inputs ViewModel
//   @override
//   Register() async {
//     // implement Register
//     inputState.add(
//       LoadingState(stateRendererType: StateRendererType.popupLoadingState),
//     );
//     (await registerUsecase.execute(
//       RegisterUsecaseInput(
//         registerObject.userName,
//         registerObject.countryMobileCode,
//         registerObject.mobileNumber,
//         registerObject.email,
//         registerObject.password,
//         registerObject.profilePicture,
//       ),
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
//         isUserRegisterSuccessfullyStreamController.add(true),
//       },
//     );
//   }

//   @override
//   void setCountryMobileCode(String countryMobileCode) {
//     //  implement setCountryMobileCode
//     if (countryMobileCode.isNotEmpty) {
//       //  update register view objec
//       registerObject = registerObject.copyWith(
//         countryMobileCode: countryMobileCode,
//       );
//     } else {
//       // reset country mobile code value in register view object
//       registerObject = registerObject.copyWith(countryMobileCode: "");
//     }
//     Validate();
//   }

//   @override
//   void setEmail(String email) {
//     EmailInput.add(email);
//     // implement setEmail
//     if (isEmailValid(email)) {
//       //  update register view object
//       registerObject = registerObject.copyWith(email: email);
//     } else {
//       // reset email value in register view object
//       registerObject = registerObject.copyWith(email: "");
//     }
//     Validate();
//   }

//   @override
//   void setMobile(String mobile) {
//     MobileInput.add(mobile);
//     //implement setMobile
//     if (_isMobilNumberValid(mobile)) {
//       //  update register view object
//       registerObject = registerObject.copyWith(mobileNumber: mobile);
//     } else {
//       // reset mobile value in register view object
//       registerObject = registerObject.copyWith(mobileNumber: "");
//     }
//     Validate();
//   }

//   @override
//   void setPassword(String password) {
//     PasswordInput.add(password);
//     // implement setPassword
//     if (_isPasswordInvalid(password)) {
//       //  update register view object
//       registerObject = registerObject.copyWith(password: password);
//     } else {
//       // reset password value in register view object
//       registerObject = registerObject.copyWith(password: "");
//     }
//     Validate();
//   }

//   @override
//   void setProfilePicture(File file) {
//     ProfilePictureInput.add(file);
//     // implement setProfilePicture
//     if (file.path.isNotEmpty) {
//       //  update register view object
//       registerObject = registerObject.copyWith(profilePicture: file.path);
//     } else {
//       // reset profile picture value in register view object
//       registerObject = registerObject.copyWith(profilePicture: "");
//     }
//     Validate();
//   }

//   @override
//   void setUserName(String userName) {
//     UserNameInput.add(userName);
//     //implement setUserName
//     if (_isUserNameValid(userName)) {
//       //  update register view object
//       registerObject = registerObject.copyWith(userName: userName);
//     } else {
//       // reset user name value in register view object
//       registerObject = registerObject.copyWith(userName: "");
//     }
//     Validate();
//   }

//   @override
//   //  implement EmailInput
//   Sink get EmailInput => _EmailController.sink;
//   @override
//   //  implement UserNameInput
//   Sink get UserNameInput => _UserNameController.sink;
//   @override
//   //  implement MobileInput
//   Sink get MobileInput => _MobileController.sink;
//   @override
//   //  implement PasswordInput
//   Sink get PasswordInput => _PasswordController.sink;
//   @override
//   //  implement ProfilePictureInput
//   Sink get ProfilePictureInput => _ProfilePictureController.sink;
//   @override
//   //  implement AllInputsValidInput
//   Sink get AllInputsValidInput => _AllInputsValidController.sink;

//   //outputs ViewModel

//   // @override
//   //   Stream<bool> get outIsPasswordValid => _passwordStreamController.stream.map(
//   //     (password) => _isPasswordValid(password),
//   @override
//   // implement UserNameOutput
//   Stream<bool> get UserNameOutput =>
//       _UserNameController.stream.map((username) => _isUserNameValid(username));

//   @override
//   //  implement UserNameErrorOutput
//   Stream<String?> get UserNameErrorOutput => UserNameOutput.map(
//     (isusername) => isusername ? null : AppStrings.userNameInvalid.tr(),
//   );

//   @override
//   //  implement EmailOutput
//   Stream<bool> get EmailOutput =>
//       _EmailController.stream.map((email) => isEmailValid(email));

//   @override
//   //  implement EmailErrorOutput
//   Stream<String?> get EmailErrorOutput => EmailOutput.map(
//     (isEmail) => isEmail ? null : AppStrings.invalidEmail.tr(),
//   );

//   @override
//   //  implement MobileOutput
//   Stream<bool> get MobileOutput => _MobileController.stream.map(
//     (mobilevalid) => _isMobilNumberValid(mobilevalid),
//   );

//   @override
//   //  implement MobileErrorOutput
//   Stream<String?> get MobileErrorOutput => MobileOutput.map(
//     (ismobile) => ismobile ? null : AppStrings.mobileNumberInvalid,
//   );

//   @override
//   // implement PasswordOutput
//   Stream<bool> get PasswordOutput => _PasswordController.stream.map(
//     (passwordinvalid) => _isPasswordInvalid(passwordinvalid),
//   );

//   @override
//   //  implement PasswordErrorOutput
//   Stream<String?> get PasswordErrorOutput => PasswordOutput.map(
//     (ispasword) => ispasword ? null : AppStrings.passwordInvalid.tr(),
//   );

//   @override
//   // implement ProfilePictureOutput
//   Stream<File> get ProfilePictureOutput =>
//       _ProfilePictureController.stream.map((file) => file);
//   @override
//   //  implement AllInputsValidOutput
//   Stream<bool> get AllInputsValidOutput => _AllInputsValidController.stream.map(
//     (_) => _areAllInputsValid(registerObject),
//   );

//   //FunctionPrivate
//   bool _isUserNameValid(String username) {
//     return username.length >= 8;
//   }

//   bool _isMobilNumberValid(String mobilnumber) {
//     return mobilnumber.length >= 10;
//   }

//   bool _isPasswordInvalid(String password) {
//     return password.length >= 6;
//   }

//   bool _areAllInputsValid(RegisterObject registerObject) {
//     return registerObject.userName.isNotEmpty &&
//         registerObject.email.isNotEmpty &&
//         registerObject.password.isNotEmpty &&
//         registerObject.mobileNumber.isNotEmpty &&
//         registerObject.countryMobileCode.isNotEmpty &&
//         registerObject.profilePicture.isNotEmpty;
//   }

//   Validate() {
//     return AllInputsValidInput.add(null);
//   }
// }

// abstract class RegisterViewModelInput {
//   Register();
//   void setUserName(String userName);
//   void setEmail(String email);
//   void setPassword(String password);
//   void setMobile(String mobile);
//   void setCountryMobileCode(String countryMobileCode);
//   void setProfilePicture(File file);
//   Sink get UserNameInput;
//   Sink get EmailInput;
//   Sink get PasswordInput;
//   Sink get MobileInput;
//   Sink get ProfilePictureInput;
//   Sink get AllInputsValidInput;
// }

// abstract class RegisterViewmodelOutput {
//   //  stream username
//   Stream<bool> get UserNameOutput;
//   Stream<String?> get UserNameErrorOutput;
//   //stream email
//   Stream<bool> get EmailOutput;
//   Stream<String?> get EmailErrorOutput;
//   //stream password
//   Stream<bool> get PasswordOutput;
//   Stream<String?> get PasswordErrorOutput;
//   //stream mobile
//   Stream<bool> get MobileOutput;
//   Stream<String?> get MobileErrorOutput;
//   //stream profile picture
//   Stream<File> get ProfilePictureOutput;
//   //stream all inputs valid
//   Stream<bool> get AllInputsValidOutput;
// }
