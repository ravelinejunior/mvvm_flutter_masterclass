import 'package:flutter/cupertino.dart';
import 'package:mvvm_flutter_masterclass/presentation/common/state_renderer/state_renderer.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/strings_manager.dart';

abstract class StateFlow {
  StateRendererType getStateRendererType();
  String getMessage();
}

class LoadingStateFlow extends StateFlow {
  StateRendererType? stateRendererType;
  String? message;

  LoadingStateFlow({String? message, @required this.stateRendererType})
      : message = message ?? AppStrings.loadingString;

  @override
  String getMessage() => message ?? "";

  @override
  StateRendererType getStateRendererType() =>
      stateRendererType ?? StateRendererType.FULL_SCREEN_LOADING_STATE;
}

class ErrorStateFlow extends StateFlow {
  StateRendererType? stateRendererType;
  String? message;

  ErrorStateFlow({@required message, @required this.stateRendererType});

  @override
  String getMessage() => message ?? "";

  @override
  StateRendererType getStateRendererType() =>
      stateRendererType ?? StateRendererType.FULL_SCREEN_ERROR_STATE;
}

class EmptyStateFlow extends StateFlow {
  String message;
  EmptyStateFlow(this.message);

  @override
  String getMessage() => "";

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.EMPTY_SCREEN_STATE;
}

class ContentStateFlow extends StateFlow {
  ContentStateFlow();

  @override
  String getMessage() => "";

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.CONTENT_SCREEN_STATE;
}
