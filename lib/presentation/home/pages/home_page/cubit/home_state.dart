import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
import 'package:mvvmclean/presentation/home/pages/home_page/cubit/home_cubit.dart';

class HomeState {
  FlowState? flowState;
  HomeRefactor? homeRefactor;

  HomeState({this.flowState, this.homeRefactor});

  HomeState copyWith({FlowState? flowState, HomeRefactor? homeRefactor}) {
    return HomeState(
      flowState: flowState ?? this.flowState,
      homeRefactor: homeRefactor ?? this.homeRefactor,
    );
  }
}
