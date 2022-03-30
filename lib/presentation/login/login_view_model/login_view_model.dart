import 'package:flutter/widgets.dart';
import 'package:mvvm_flutter_masterclass/data/model/login_use_case_input_model.dart';
import 'package:mvvm_flutter_masterclass/domain/use_case/login_use_case.dart';
import 'package:mvvm_flutter_masterclass/presentation/base/base_view_model.dart';
import 'package:mvvm_flutter_masterclass/presentation/common/freezed_data_classes.dart';
import 'package:mvvm_flutter_masterclass/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mvvm_flutter_masterclass/presentation/common/state_renderer/state_renderer.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final BehaviorSubject _userNameStreamController = BehaviorSubject<String>();

  final BehaviorSubject _userPasswordStreamController =
      BehaviorSubject<String>();

  final BehaviorSubject _isAllInputsValidStreamController =
      BehaviorSubject<void>();

  final BehaviorSubject isUserLoggedStreamController = BehaviorSubject<bool>();

  var loginObject = LoginObject("", "");

  final LoginUseCase? _loginUseCase;
  LoginViewModel(this._loginUseCase);

  ///from base view model
  @override
  void start() {
    inputState.add(ContentStateFlow());
  }

  @override
  void dispose() {
    _userNameStreamController.close();
    _userPasswordStreamController.close();
    _isAllInputsValidStreamController.close();
    isUserLoggedStreamController.close();
  }

//from streams implementation
  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputUserPassword => _userPasswordStreamController.sink;

  @override
  Sink get inputIsAllInputsValid => _isAllInputsValidStreamController.sink;

  @override
  loginUser() async {
    inputState.add(LoadingStateFlow(
        stateRendererType: StateRendererType.POPUP_LOADING_STATE));

    (await _loginUseCase?.execute(LoginUseCaseInputModel(
            email: loginObject.userName, password: loginObject.userPassword)))
        ?.fold(
      (failure) => {
        // left -> failure
        inputState.add(
          ErrorStateFlow(
            message: failure.message,
            stateRendererType: StateRendererType.FULL_SCREEN_ERROR_STATE,
          ),
        ),
        debugPrint(failure.message)
      },
      (data) {
        //right -> success
        inputState.add(ContentStateFlow());
        isUserLoggedStreamController.add(true);
        //go to main after loading
        debugPrint(data.toString());
      },
    );
  }

  @override
  Stream<bool> get outputIsUserNameValid =>
      _userNameStreamController.stream.map((name) => _isNameValid(name));

  @override
  Stream<bool> get outputIsUserPasswordValid =>
      _userPasswordStreamController.stream
          .map((pass) => _isPasswordValid(pass));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllValid());

  @override
  setPassword(String password) {
    inputUserPassword.add(password);
    loginObject = loginObject.copyWith(userPassword: password);
    inputIsAllInputsValid.add(null);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    inputIsAllInputsValid.add(null);
  }

  _isNameValid(String name) {
    return name.isNotEmpty;
  }

  _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isAllValid() {
    return _isNameValid(loginObject.userName) &&
        _isPasswordValid(loginObject.userPassword);
  }
}

abstract class LoginViewModelInputs {
  //three functions
  setUserName(String userName);
  setPassword(String password);
  loginUser();
  // two sinks

  Sink get inputUserName;
  Sink get inputUserPassword;
  Sink get inputIsAllInputsValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsUserPasswordValid;
  Stream<bool> get outputIsAllInputsValid;
}
