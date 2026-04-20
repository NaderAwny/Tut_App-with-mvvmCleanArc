import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvmclean/domain/usecase/home-details.dart';
import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer.dart';
import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
import 'package:mvvmclean/presentation/store_details/cubit/store_detalis_state.dart';

class StoreDetailsCubit extends Cubit<StoreDetailsState> {
  final HomeDetailsUseCase _storeDetailsUseCase;
  StoreDetailsCubit(this._storeDetailsUseCase) : super(StoreDetailsState());
  int? currentid;
  void setStoreId(int id) {
    currentid = id;
  }

  void getStoreDetails(int input) async {
    //implement getHomeData
    emit(
      StoreDetailsState(
        flowState: LoadingState(
          stateRendererType: StateRendererType.fullScreenLoadingState,
        ),
      ),
    );
    // ignore: void_checks
    (await _storeDetailsUseCase.execute(input)).fold(
      (failure) => {
        // left -> failure
        emit(
          StoreDetailsState(
            flowState: ErrorState(
              StateRendererType.fullScreenErrorState,
              failure.message,
            ),
          ),
        ),
      },
      (homeObject) => {
        // right -> data (success)
        // print(data.customer?.name),
        emit(
          StoreDetailsState(
            flowState: ContentState(),
            homeDetailsObject: homeObject,
          ),
        ),
      },
    );
  }
}
