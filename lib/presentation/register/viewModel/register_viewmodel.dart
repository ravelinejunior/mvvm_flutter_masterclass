import 'package:flutter/material.dart';
import 'package:mvvm_flutter_masterclass/data/model/register_user_model/register_user_model.dart';
import 'package:mvvm_flutter_masterclass/domain/use_case/register_use_case.dart';
import 'package:mvvm_flutter_masterclass/presentation/base/base_view_model.dart';
import 'package:mvvm_flutter_masterclass/presentation/common/freezed_data_classes.dart';
import 'package:mvvm_flutter_masterclass/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mvvm_flutter_masterclass/presentation/common/state_renderer/state_renderer.dart';
import 'package:rxdart/rxdart.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInputs, RegisterViewModelOutputs {
  final BehaviorSubject _userNameStreamController = BehaviorSubject<String>();
  final BehaviorSubject _userEmailStreamController = BehaviorSubject<String>();
  final BehaviorSubject _userPhoneStreamController = BehaviorSubject<String>();
  final BehaviorSubject _userSexStreamController = BehaviorSubject<String>();
  final BehaviorSubject _userPasswordStreamController =
      BehaviorSubject<String>();

  final BehaviorSubject isUserLoggedStreamController = BehaviorSubject<bool>();

  final BehaviorSubject _userAllDataValidStreamController =
      BehaviorSubject<bool>();

  var registerObject = RegisterObject("", "", "", "", "");

  final RegisterUseCase? _registerUseCase;
  RegisterViewModel(this._registerUseCase);

  @override
  void start() {
    inputState.add(ContentStateFlow());
  }

  @override
  void dispose() {
    _userEmailStreamController.close();
    _userNameStreamController.close();
    _userPhoneStreamController.close();
    _userSexStreamController.close();
    _userPasswordStreamController.close();
    isUserLoggedStreamController.close();
  }

  @override
  Sink get inputUserEmail => _userEmailStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputUserPassword => _userPasswordStreamController.sink;

  @override
  Sink get inputUserPhone => _userPhoneStreamController.sink;

  @override
  Sink get inputUserSex => _userSexStreamController.sink;

  @override
  Sink get inputUserAllDataValid => _userAllDataValidStreamController.sink;

  @override
  Stream<bool> get outputIsUserEmailValid =>
      _userEmailStreamController.stream.map(
        (email) => _isUserEmailValid(email),
      );

  @override
  Stream<bool> get outputIsUserNameValid =>
      _userNameStreamController.stream.map(
        (name) => _isUserNameValid(name),
      );

  @override
  Stream<bool> get outputIsUserPasswordValid =>
      _userPasswordStreamController.stream.map(
        (password) => _isUserPasswordValid(password),
      );

  @override
  Stream<bool> get outputIsUserPhoneValid =>
      _userPhoneStreamController.stream.map(
        (phone) => _isUserPhoneValid(phone),
      );

  @override
  Stream<bool> get outputIsUserSexValid => _userSexStreamController.stream.map(
        (sex) => _isUserSexValid(sex),
      );

  @override
  Stream<bool> get outputIsAllUserDataInputsValid =>
      _userAllDataValidStreamController.stream.map(
        (_) => _isAllDataValid(),
      );

  @override
  setUserEmail(String userEmail) {
    _userEmailStreamController.add(userEmail);
    registerObject = registerObject.copyWith(userEmail: userEmail);
    inputUserAllDataValid.add(null);
  }

  @override
  setUserName(String userName) {
    _userNameStreamController.add(userName);
    registerObject = registerObject.copyWith(userName: userName);
    inputUserAllDataValid.add(null);
  }

  @override
  setUserPassword(String userPassword) {
    _userPasswordStreamController.add(userPassword);
    registerObject = registerObject.copyWith(userPassword: userPassword);
    inputUserAllDataValid.add(null);
  }

  @override
  setUserPhone(String userPhone) {
    _userPhoneStreamController.add(userPhone);
    registerObject = registerObject.copyWith(userPhone: userPhone);
    inputUserAllDataValid.add(null);
  }

  @override
  setUserSex(String userSex) {
    _userSexStreamController.add(userSex);
    registerObject = registerObject.copyWith(userSex: userSex);
    inputUserAllDataValid.add(null);
  }

  @override
  registerUser() async {
    inputState.add(
      LoadingStateFlow(
          stateRendererType: StateRendererType.POPUP_LOADING_STATE),
    );

    (await _registerUseCase?.execute(RegisterUserModel(
      userName: registerObject.userName,
      email: registerObject.userEmail,
      phone: registerObject.userPhone,
      sex: registerObject.userSex,
      password: registerObject.userPassword,
    )))
        ?.fold(
      (fail) => {
        // left -> failure
        inputState.add(
          ErrorStateFlow(
            message: fail.message,
            stateRendererType: StateRendererType.FULL_SCREEN_ERROR_STATE,
          ),
        ),
        debugPrint(fail.message)
      },
      (data) => {
        inputState.add(ContentStateFlow()),
        isUserLoggedStreamController.add(true),
        //go to main after loading
        debugPrint(data.toString())
      },
    );
  }

  bool _isUserNameValid(String name) {
    return name.isNotEmpty && name.length > 6;
  }

  bool _isUserEmailValid(String email) {
    return email.isNotEmpty && email.contains("@") && email.contains(".com");
  }

  bool _isUserPhoneValid(String phone) {
    return phone.isNotEmpty && phone.length >= 12;
  }

  bool _isUserSexValid(String sex) {
    return sex.isNotEmpty;
  }

  bool _isUserPasswordValid(String password) {
    return password.isNotEmpty && password.length >= 4;
  }

  bool _isAllDataValid() =>
      _isUserNameValid(registerObject.userName) &&
      _isUserEmailValid(registerObject.userEmail) &&
      _isUserPhoneValid(registerObject.userPhone) &&
      _isUserSexValid(registerObject.userSex) &&
      _isUserPasswordValid(registerObject.userPassword);
}

abstract class RegisterViewModelInputs {
  setUserName(String userName);
  setUserPhone(String userPhone);
  setUserEmail(String userEmail);
  setUserPassword(String userPassword);
  setUserSex(String userSex);

  registerUser();

  Sink get inputUserName;
  Sink get inputUserEmail;
  Sink get inputUserPhone;
  Sink get inputUserSex;
  Sink get inputUserPassword;
  Sink get inputUserAllDataValid;
}

abstract class RegisterViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsUserEmailValid;
  Stream<bool> get outputIsUserPhoneValid;
  Stream<bool> get outputIsUserSexValid;
  Stream<bool> get outputIsUserPasswordValid;
  //Validation Input
  Stream<bool> get outputIsAllUserDataInputsValid;
}
