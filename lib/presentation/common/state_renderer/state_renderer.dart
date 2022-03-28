import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_flutter_masterclass/data/response/failure_response.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/color_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/font_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/strings_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/values_manager.dart';

enum StateRendererType {
  //Popup
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,

  //Full Screen State
  FULL_SCREEN_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,
  CONTENT_SCREEN_STATE,
  EMPTY_SCREEN_STATE,
}

class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  Failure failure;
  String message;
  String title;
  Function? retryActionFunction;

  StateRenderer({
    Key? key,
    required this.stateRendererType,
    Failure? failure,
    String? message,
    String? title,
    required this.retryActionFunction,
  })  : message = message ?? AppStrings.loadingString,
        title = title ?? "",
        failure = failure ?? DefaultFailure(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.POPUP_LOADING_STATE:
        break;
      case StateRendererType.POPUP_ERROR_STATE:
        break;
      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        _getItemsInColumn([_getAnimatedImage(),_getMessage(message)]);
        break;
      case StateRendererType.FULL_SCREEN_ERROR_STATE:
       _getItemsInColumn([_getAnimatedImage(),_getMessage(message),_getRetryButton(AppStrings.retryAgainString,context)]);
        break;
      case StateRendererType.CONTENT_SCREEN_STATE:
        break;
      case StateRendererType.EMPTY_SCREEN_STATE:
        break;
      default:
        return Container();
    }
  }

  Widget _getAnimatedImage(){
    return SizedBox(
      height: AppFontSize.s100,
      width: AppFontSize.s100,
      child: //json image,
    );
  }

  Widget _getMessage(String message){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppFontSize.s18),
        child: Text(message,style: GoogleFonts.lato(color:ColorManager.black,fontSize: FontSizeManager.s16,)),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle,BuildContext context){
    return  Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
          width: AppFontSize.s200,
          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              shadowColor: Colors.orange,
                              minimumSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppFontSize.s16),
                              ),
                            ),
                            onPressed:() {
                              if(stateRendererType == StateRendererType.FULL_SCREEN_ERROR_STATE){
                                retryActionFunction?.call(); // call inside the api
                              }else {
                                Get.back();
                              }
                            },
                            child: Text(
                              buttonTitle,
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppFontSize.s16,
                              
                            ),
                          ),),
        ),
      ),
    );
  }

  Widget _getItemsInColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
