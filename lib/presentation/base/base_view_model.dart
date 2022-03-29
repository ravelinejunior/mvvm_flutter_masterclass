import 'package:mvvm_flutter_masterclass/presentation/common/state_renderer/state_render_impl.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  final BehaviorSubject _inputStateSreamController =
      BehaviorSubject<StateFlow>();

  @override
  Stream<StateFlow> get outputState =>
      _inputStateSreamController.stream.map((stateFlow) => stateFlow);

  @override
  Sink get inputState => _inputStateSreamController.sink;

  @override
  void dispose() {
    _inputStateSreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start();
  void dispose();

  Sink get inputState;
}

abstract class BaseViewModelOutputs {
  Stream<StateFlow> get outputState;
}
