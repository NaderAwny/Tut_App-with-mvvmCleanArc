import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mvvmclean/app/app_prefs.dart';
import 'package:mvvmclean/data/data_source/local_data_source.dart';
import 'package:mvvmclean/data/data_source/remote_data_source.dart';
import 'package:mvvmclean/data/network/app_api.dart';
import 'package:mvvmclean/data/network/dio_factory.dart';
import 'package:mvvmclean/data/network/network_info.dart';
import 'package:mvvmclean/data/repository/repository..impl.dart';
import 'package:mvvmclean/domain/repository/repository.dart';
import 'package:mvvmclean/domain/usecase/forget_password_usecase.dart';
import 'package:mvvmclean/domain/usecase/home-details.dart';
import 'package:mvvmclean/domain/usecase/home_usecase.dart';
import 'package:mvvmclean/domain/usecase/login_usecase.dart';
import 'package:mvvmclean/domain/usecase/register_usecse.dart';
import 'package:mvvmclean/presentation/forgot_password/cubit/forget_password_cubit.dart';
// import 'package:mvvmclean/presentation/forgot_password/viewmodel/forgetpassword.dart';
import 'package:mvvmclean/presentation/home/pages/home_page/cubit/home_cubit.dart';
//import 'package:mvvmclean/presentation/home/pages/home_page/view_model/home_viewmodel.dart';
import 'package:mvvmclean/presentation/login/cubit/login_cubit.dart';
import 'package:mvvmclean/presentation/register/cubit/register_cubit.dart';
import 'package:mvvmclean/presentation/store_details/cubit/store_deatlis_cubit.dart';
//import 'package:mvvmclean/presentation/store_details/viewmodel/store_details_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;
Future<void> initAppModule(Box box) async {
  instance.registerLazySingleton<Box<dynamic>>(() => box);
  // app module, its a module where we put all generic dependencies
  //shared preferences instance
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferences(instance()),
  );

  // internet connection checker with custom addresses
  instance.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(
      addresses: [
        AddressCheckOption(
          uri: Uri.parse('https://google.com'),
          timeout: const Duration(seconds: 5),
        ),
        AddressCheckOption(
          uri: Uri.parse('https://cloudflare.com'),
          timeout: const Duration(seconds: 5),
        ),
        AddressCheckOption(
          uri: Uri.parse('https://example.com'),
          timeout: const Duration(seconds: 5),
        ),
      ],
    ),
  );

  // network info
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(instance<InternetConnectionChecker>()),
  );

  //dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
  //dio
  final dio = await instance<DioFactory>().getDio();
  //app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  //remote data source
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(instance<AppServiceClient>()),
  );
  //local data source
  instance.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(instance<Box<dynamic>>()),
  );
  // repository
  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      instance<RemoteDataSource>(),
      instance<LocalDataSource>(),
      instance<NetworkInfo>(),
    ),
  );
}

// ignore: strict_top_level_inference
initLoginModule() {
  if (!instance.isRegistered<LoginUsecase>()) {
    instance.registerFactory<LoginUsecase>(() => LoginUsecase(instance()));
    // instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
    instance.registerFactory<LoginCubit>(() => LoginCubit(instance()));
  }
}

// ignore: strict_top_level_inference
initForgotPasswordModule() {
  if (!instance.isRegistered<ForgetPasswordUsecase>()) {
    instance.registerFactory<ForgetPasswordUsecase>(
      () => ForgetPasswordUsecase(instance()),
    );
    // instance.registerFactory<ForgetPasswordViewModel>(
    //   () => ForgetPasswordViewModel(instance()),
    // );
    instance.registerFactory<ForgetPasswordCubit>(
      () => ForgetPasswordCubit(instance()),
    );
  }
}

// ignore: strict_top_level_inference
initRegisterModule() {
  if (!instance.isRegistered<RegisterUsecase>()) {
    instance.registerFactory<RegisterUsecase>(
      () => RegisterUsecase(instance()),
    );
    // instance.registerFactory<RegisterViewModel>(
    //   () => RegisterViewModel(instance()),
    // );
    instance.registerFactory<ImagePicker>(() => ImagePicker());
    instance.registerFactory<RegisterCubit>(() => RegisterCubit(instance()));
  }
}

// ignore: strict_top_level_inference
initHomeModule() {
  if (!instance.isRegistered<HomeUsecase>()) {
    instance.registerFactory<HomeUsecase>(() => HomeUsecase(instance()));
    // instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
    instance.registerFactory<HomeCubit>(() => HomeCubit(instance()));
  }
}

// ignore: strict_top_level_inference
initStoreDetailsModule() {
  if (!instance.isRegistered<HomeDetailsUseCase>()) {
    instance.registerFactory<HomeDetailsUseCase>(
      () => HomeDetailsUseCase(instance()),
    );
    // instance.registerFactory<StoreDetailsViewModel>(
    //   () => StoreDetailsViewModel(instance()),
    // );
    instance.registerFactory<StoreDetailsCubit>(
      () => StoreDetailsCubit(instance()),
    );
  }
}
