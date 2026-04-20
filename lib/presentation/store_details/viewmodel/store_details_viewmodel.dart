// import 'dart:async';
// import 'package:mvvmclean/domain/model/models.dart';
// import 'package:mvvmclean/domain/usecase/home-details.dart';
// import 'package:mvvmclean/presentation/base/baseviewmodel.dart';
// import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer.dart';
// import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
// import 'package:rxdart/rxdart.dart';

// // 1️⃣ سبب المشكلة الأصلي
// // أول مرة بتدخل على صفحة StoreDetailsView، الـ ViewModel بيجيب بيانات store/1 ويحطها في الـ BehaviorSubject.
// // لما تحاول تدخل على store/2، الـ ViewModel مش بيعرف أنه Store جديد لأنه معرف storeId ثابت (final) من أول مرة.
// // النتيجة: الصفحة بتعرض البيانات القديمة، لازم restart عشان يعيد الـ ViewModel من البداية.
// // 2️⃣ التعديل اللي عملناه
// // خلى الـ storeId ديناميكي بدل ما يكون ثابت.
// // أضفنا دالة setStoreId(int storeId) في الـ ViewModel.
// // كل مرة نغير الـ store، نقدر نرسل ID جديد للـ ViewModel، وهو يقوم بـ:
// // تحديث _currentStoreId.
// // جلب البيانات الجديدة من API.
// // إضافة البيانات الجديدة في Stream ليعرضها الـ UI مباشرة.
// // 3️⃣ النتيجة والفائدة
// // داتا جديدة مباشرة بدون restart: لما تدخل على store جديد، الصفحة بتحدث نفسها.
// // مرونة أعلى: نفس ViewModel يقدر يتعامل مع أي store ID في أي وقت.
// // التزام بـ MVVM Clean Architecture:
// // الـ UI يتابع Stream واحد فقط (outputStoreDetails).
// // الـ ViewModel مسؤول عن إدارة البيانات (fetching + state).
// // تجنب Bugs مستقبلية: لما يكون عندك navigation بين أكثر من store، مش هتواجه مشكلة عرض البيانات القديمة.

// // باختصار 🔹: ده حل مشكلة البيانات القديمة في الـ Stream، وخلى الـ ViewModel ديناميكي وقابل لإعادة التحميل لأي store جديد بدون أي restart

// class StoreDetailsViewModel extends BaseViewModel
//     implements StoreDetailsViewModelInputs, StoreDetailsViewModelOutputs {
//   final StreamController _storeDetailsStreamController =
//       BehaviorSubject<HomeDetailsObject>();
//   final HomeDetailsUseCase _storeDetailsUseCase;

//   StoreDetailsViewModel(this._storeDetailsUseCase);
//   int? _currentid;
//   void setStoreId(int id) {
//     _currentid = id;
//   }

//   @override
//   void start() {
//     // implement start
//     _getStoreDetails(_currentid!);
//   }

//   @override
//   // ignore: unnecessary_overrides
//   void dispose() {
//     super.dispose();
//     _storeDetailsStreamController.close();
//   }

//   @override
//   // implement inputStoreDetails
//   Sink get inputStoreDetails => _storeDetailsStreamController.sink;

//   @override
//   // implement outputStoreDetails
//   Stream<HomeDetailsObject> get outputStoreDetails =>
//       _storeDetailsStreamController.stream.map((storeDetails) => storeDetails);
//   //private methods
//   // ignore: unused_element, strict_top_level_inference
//   _getStoreDetails(int input) async {
//     //implement getHomeData
//     inputState.add(
//       LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState),
//     );
//     // ignore: void_checks
//     (await _storeDetailsUseCase.execute(input)).fold(
//       (failure) => {
//         // left -> failure
//         inputState.add(
//           ErrorState(StateRendererType.fullScreenErrorState, failure.message),
//         ),
//       },
//       (homeObject) => {
//         // right -> data (success)
//         // print(data.customer?.name),
//         inputState.add(ContentState()),
//         _storeDetailsStreamController.add(homeObject),
//       },
//     );
//   }
// }

// abstract class StoreDetailsViewModelInputs {
//   Sink get inputStoreDetails;
// }

// abstract class StoreDetailsViewModelOutputs {
//   Stream<HomeDetailsObject> get outputStoreDetails;
// }
