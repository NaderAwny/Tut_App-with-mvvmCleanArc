// // import 'dart:async';
// // import 'dart:ffi';
// // import 'package:mvvmclean/domain/model/models.dart';
// // import 'package:mvvmclean/domain/usecase/home_usecase.dart';
// // import 'package:mvvmclean/presentation/base/baseviewmodel.dart';
// // import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer.dart';
// // import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
// // import 'package:rxdart/rxdart.dart';

// // class HomeViewModel extends BaseViewModel
// //     implements HomeViewModelInput, HomeViewModelOutput {
// //   // final StreamController _servicesStreamController =
// //   //     StreamController<List<Services>>.broadcast();
// //   // final StreamController _storesStreamController =
// //   //     StreamController<List<Store>>.broadcast();
// //   // final StreamController _bannersStreamController =
// //   //     StreamController<List<BannerAD>>.broadcast();
// //   //use behavior subject instead of stream controller and ==work BroadcastStreamController
// //   final StreamController _servicesStreamController =
// //       BehaviorSubject<List<ServicesAd>>();
// //   final StreamController _storesStreamController =
// //       BehaviorSubject<List<Store>>();
// //   final StreamController _bannersStreamController =
// //       BehaviorSubject<List<BannerAD>>();

// //   final HomeUsecase _homeUsecase;
// //   HomeViewModel(this._homeUsecase);
// //   @override
// //   void start() {
// //     //call api from data
// //     _getHomeData();
// //   }

// //   @override
// //   // ignore: unnecessary_overrides
// //   void dispose() {
// //     _servicesStreamController.close();
// //     _storesStreamController.close();
// //     _bannersStreamController.close();
// //     super.dispose();
// //   }

// //   @override
// //   //implement bannersInput
// //   Sink get bannersInput => _bannersStreamController.sink;

// //   @override
// //   //implement bannersOutput
// //   Stream<List<BannerAD>> get bannersOutput =>
// //       _bannersStreamController.stream.map((banners) => banners);

// //   // ignore: strict_top_level_inference
// //   _getHomeData() async {
// //     //implement getHomeData
// //     inputState.add(
// //       LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState),
// //     );
// //     // ignore: void_checks
// //     (await _homeUsecase.execute(Void)).fold(
// //       (failure) => {
// //         // left -> failure
// //         inputState.add(
// //           ErrorState(StateRendererType.fullScreenErrorState, failure.message),
// //         ),
// //         // ignore: avoid_print
// //         print(failure.message),
// //         print(failure.message),
// //       },
// //       (homeObject) => {
// //         // right -> data (success)
// //         // ignore: avoid_print
// //         // print(data.customer?.name),
// //         inputState.add(ContentState()),
// //         _servicesStreamController.add(homeObject.data?.services),
// //         _storesStreamController.add(homeObject.data?.stores),
// //         _bannersStreamController.add(homeObject.data?.banners),
// //         print(homeObject.data),
// //       },
// //     );
// //   }

// //   @override
// //   //implement servicesInput
// //   Sink get servicesInput => _servicesStreamController.sink;

// //   @override
// //   //implement servicesOutput
// //   Stream<List<ServicesAd>> get servicesOutput =>
// //       _servicesStreamController.stream.map((services) => services);

// //   @override
// //   // implement storesInput
// //   Sink get storesInput => _storesStreamController.sink;

// //   @override
// //   // implement storesOutput
// //   Stream<List<Store>> get storesOutput =>
// //       _storesStreamController.stream.map((stores) => stores);
// // }

// // abstract class HomeViewModelInput {
// //   Sink get servicesInput;
// //   Sink get storesInput;
// //   Sink get bannersInput;
// //   // ignore: strict_top_level_inference
// // }

// // ignore_for_file: avoid_print

// // abstract class HomeViewModelOutput {
// //   Stream<List<ServicesAd>> get servicesOutput;
// //   Stream<List<Store>> get storesOutput;
// //   Stream<List<BannerAD>> get bannersOutput;
// // }
// import 'dart:async';
// import 'dart:ffi';
// import 'package:mvvmclean/domain/model/models.dart';
// import 'package:mvvmclean/domain/usecase/home_usecase.dart';
// import 'package:mvvmclean/presentation/base/baseviewmodel.dart';
// import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer.dart';
// import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
// import 'package:rxdart/rxdart.dart';

// class HomeViewModel extends BaseViewModel
//     implements HomeViewModelInput, HomeViewModelOutput {
//   // final StreamController _servicesStreamController =
//   //     StreamController<List<Services>>.broadcast();
//   // final StreamController _storesStreamController =
//   //     StreamController<List<Store>>.broadcast();
//   // final StreamController _bannersStreamController =
//   //     StreamController<List<BannerAD>>.broadcast();
//   //use behavior subject instead of stream controller and ==work BroadcastStreamController
//   final StreamController _homeStreamController =
//       BehaviorSubject<HomeRefactor>();

//   final HomeUsecase _homeUsecase;
//   HomeViewModel(this._homeUsecase);
//   @override
//   void start() {
//     //call api from data
//     _getHomeData();
//   }

//   @override
//   // ignore: unnecessary_overrides
//   void dispose() {
//     _homeStreamController.close();
//     super.dispose();
//   }

//   // ignore: strict_top_level_inference
//   _getHomeData() async {
//     //implement getHomeData
//     inputState.add(
//       LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState),
//     );
//     // ignore: void_checks
//     (await _homeUsecase.execute(Void)).fold(
//       (failure) => {
//         // left -> failure
//         inputState.add(
//           ErrorState(StateRendererType.fullScreenErrorState, failure.message),
//         ),

//         print(failure.message),
//         print(failure.message),
//       },
//       (homeObject) => {
//         // right -> data (success)
//         // print(data.customer?.name),
//         inputState.add(ContentState()),
//         _homeStreamController.add(
//           HomeRefactor(
//             homeObject.data.services,
//             homeObject.data.stores,
//             homeObject.data.banners,
//           ),
//         ),

//         print(homeObject.data),
//       },
//     );
//   }

//   @override
//   //implement servicesInput
//   Sink get homeInput => _homeStreamController.sink;

//   @override
//   //implement servicesOutput
//   Stream<HomeRefactor> get homeOutput =>
//       _homeStreamController.stream.map((home) => home);
// }

// abstract class HomeViewModelInput {
//   Sink get homeInput;

//   // ignore: strict_top_level_inference
// }

// abstract class HomeViewModelOutput {
//   Stream<HomeRefactor> get homeOutput;
// }

// class HomeRefactor {
//   final List<ServicesAd> services;
//   final List<Store> stores;
//   final List<BannerAD> banners;
//   HomeRefactor(this.services, this.stores, this.banners);
// }
