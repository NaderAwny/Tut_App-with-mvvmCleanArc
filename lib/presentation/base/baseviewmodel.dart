import 'dart:async';

import 'package:mvvmclean/presentation/common/state_rendrer/state_randrer_impl.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // shared variables and function that will be used through any view model.

  final StreamController stateController = BehaviorSubject<FlowState>();
  @override
  Sink get inputState => stateController.sink;
  @override
  Stream<FlowState> get outputState =>
      stateController.stream.map((flowState) => flowState);
  @override
  void dispose() {
    stateController.close();
  }
}

abstract class BaseViewModelInputs {
  void start(); // will be called when view model starts its job
  void dispose(); // will be called when view model dies
  Sink get inputState;
}

abstract mixin class BaseViewModelOutputs {
  Stream<FlowState> get outputState;
  // will be implemented later
}
