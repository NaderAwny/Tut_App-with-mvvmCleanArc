import 'package:mvvmclean/domain/model/models.dart';
import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';

class StoreDetailsState {
  FlowState? flowState;
  HomeDetailsObject? homeDetailsObject;

  StoreDetailsState({this.flowState, this.homeDetailsObject});

  StoreDetailsState copyWith({
    FlowState? flowState,
    HomeDetailsObject? homeDetailsObject,
  }) {
    return StoreDetailsState(
      flowState: flowState ?? this.flowState,
      homeDetailsObject: homeDetailsObject ?? this.homeDetailsObject,
    );
  }
}
