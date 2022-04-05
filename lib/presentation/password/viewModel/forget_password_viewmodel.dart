import 'package:flutter/material.dart';
import 'package:mvvm_flutter_masterclass/domain/use_case/forget_password_use_case.dart';
import 'package:mvvm_flutter_masterclass/presentation/base/base_view_model.dart';
import 'package:mvvm_flutter_masterclass/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mvvm_flutter_masterclass/presentation/common/state_renderer/state_renderer.dart';
import 'package:rxdart/rxdart.dart';

class ForgetPasswordViewModel extends BaseViewModel
    with ForgetPasswordInput, ForgetPasswordOutput {
  final _userEmailStreamController = BehaviorSubject<String>();

  final ForgetPasswordUseCase? _forgetPasswordUseCase;
  ForgetPasswordViewModel(this._forgetPasswordUseCase);

  var mEmail = "";

  @override
  Sink get inputUserEmail => _userEmailStreamController.sink;

  @override
  Stream<bool> get outputIsUserEmailValid => _userEmailStreamController.stream
      .map((email) => _isUserEmailValid(email));

  @override
  setUserEmail(String email) {
    mEmail = email;
    inputUserEmail.add(email);
  }

  @override
  void start() async {
    inputState.add(
      LoadingStateFlow(
          stateRendererType: StateRendererType.POPUP_LOADING_STATE),
    );

    await Future.delayed(const Duration(seconds: 1))
        .then((value) => inputState.add(ContentStateFlow()));
  }

  @override
  void dispose() {
    _userEmailStreamController.close();
  }

  @override
  sendEmail() async {
    inputState.add(LoadingStateFlow(
        stateRendererType: StateRendererType.POPUP_LOADING_STATE));

    (await _forgetPasswordUseCase?.execute(mEmail))?.fold(
      (fail) => {
        inputState.add(
          ErrorStateFlow(
            message: fail.message,
            stateRendererType: StateRendererType.FULL_SCREEN_ERROR_STATE,
          ),
        ),
        debugPrint(fail.message)
      },
      (data) =>
          {inputState.add(ContentStateFlow()), debugPrint(data.toString())},
    );
  }

  bool _isUserEmailValid(String email) {
    return email.isNotEmpty;
  }
}

abstract class ForgetPasswordInput {
  setUserEmail(String email);
  sendEmail();

  Sink get inputUserEmail;
}

abstract class ForgetPasswordOutput {
  Stream<bool> get outputIsUserEmailValid;
}
