import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvmclean/domain/model/models.dart';
import 'package:mvvmclean/domain/usecase/home_usecase.dart';
import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer.dart';
import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
import 'package:mvvmclean/presentation/home/pages/home_page/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUsecase _homeUsecase;
  HomeCubit(this._homeUsecase) : super(HomeState());

  // ignore: strict_top_level_inference
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  //implement getHomeData
  // ignore: unused_element
  void getHomeData() async {
    //implement getHomeData
    // if (!isClosed) {
    emit(
      state.copyWith(
        flowState: LoadingState(
          stateRendererType: StateRendererType.fullScreenLoadingState,
        ),
      ),
    );

    // ignore: void_checks
    (await _homeUsecase.execute(Void)).fold(
      (failure) => {
        // left -> failure
        //if (!isClosed)
        emit(
          state.copyWith(
            flowState: ErrorState(
              StateRendererType.fullScreenErrorState,
              failure.message,
            ),
          ),
        ),

        // ignore: avoid_print
        print(failure.message),
      },
      (homeObject) => {
        // right -> data (success)
        // if (!isClosed)
        emit(
          state.copyWith(
            homeRefactor: HomeRefactor(
              homeObject.data.services,
              homeObject.data.stores,
              homeObject.data.banners,
            ),
            flowState: ContentState(),
          ),
        ),

        // ignore: avoid_print
        print(homeObject.data),
      },
    );
  }
}

class HomeRefactor {
  final List<ServicesAd> services;
  final List<Store> stores;
  final List<BannerAD> banners;
  HomeRefactor(this.services, this.stores, this.banners);
}
