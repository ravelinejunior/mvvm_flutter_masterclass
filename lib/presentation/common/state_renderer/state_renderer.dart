enum StateRendererType{
  //Popup 
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,

  //Full Screen State
  FULL_SCREEN_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,
  CONTENT_SCREEN_STATE,
  EMPTY_SCREEN_STATE,
}

import 'package:flutter/material.dart';

class StateRenderer extends StatelessWidget {

StateRendererType stateRendererType;
Failure failure;
String message;
String title;
Function retryActionFunction;

  StateRenderer({ Key? key, 
    required this.stateRendererType,
     Failure? failure,
    String? message,
    String? title,
    required this.retryActionFunction,
    }
  ) : 
  message = message ?? AppStrings.loading,
  title = title ?? "",
  failure = failure ?? DefaultFailure(),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}