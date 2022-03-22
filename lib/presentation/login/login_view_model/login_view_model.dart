import 'package:flutter/widgets.dart';
import 'package:mvvm_flutter_masterclass/data/model/login_use_case_input_model.dart';
import 'package:mvvm_flutter_masterclass/domain/use_case/login_use_case.dart';
import 'package:mvvm_flutter_masterclass/presentation/base/base_view_model.dart';
import 'package:mvvm_flutter_masterclass/presentation/common/freezed_data_classes.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final BehaviorSubject _userNameStreamController = BehaviorSubject<String>();
  final BehaviorSubject _userPasswordStreamController =
      BehaviorSubject<String>();

  var loginObject = LoginObject("", "");

  final LoginUseCase? _loginUseCase;
  LoginViewModel(this._loginUseCase);

  ///from base view model
  @override
  void start() {}

  @override
  void dispose() {
    _userNameStreamController.close();
    _userPasswordStreamController.close();
  }

//from streams implementation
  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputUserPassword => _userPasswordStreamController.sink;

  @override
  loginUser() async {
    (await _loginUseCase?.execute(LoginUseCaseInputModel(
            email: loginObject.userName, password: loginObject.userPassword)))
        ?.fold(
            (failure) => {
                  // left -> failure
                  debugPrint(failure.message)
                },
            (data) => {
                  //right -> success
                  debugPrint(data.toString())
                });
  }

  @override
  Stream<bool> get outputIsUserNameValid =>
      _userNameStreamController.stream.map((name) => _isNameValid(name));

  @override
  Stream<bool> get outputIsUserPasswordValid =>
      _userPasswordStreamController.stream
          .map((pass) => _isPasswordValid(pass));

  @override
  setPassword(String password) {
    inputUserPassword.add(password);
    loginObject = loginObject.copyWith(userPassword: password);
  }

  @override
  setUserName(String userName) {
    inputUserPassword.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
  }

  _isNameValid(String name) {
    return name.isNotEmpty;
  }

  _isPasswordValid(String password) {
    return password.isNotEmpty;
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
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsUserPasswordValid;
}
