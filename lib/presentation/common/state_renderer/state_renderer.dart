import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.POPUP_LOADING_STATE:
        return _getPopupDialog(
            context, [_getAnimatedImage('loading_lottie.json')]);
      case StateRendererType.POPUP_ERROR_STATE:
        return _getPopupDialog(context, [
          _getAnimatedImage('error_lottie.json'),
          _getMessage(failure.message),
          _getRetryButton(
            AppStrings.retryAgainString,
            context,
          ),
        ]);
      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        return _getItemsInColumn(
            [_getAnimatedImage('loading_lottie.json'), _getMessage(message)]);

      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        return _getItemsInColumn([
          _getAnimatedImage('not_found_lottie.json'),
          _getMessage(message),
          _getRetryButton(AppStrings.confirmString, context)
        ]);
      case StateRendererType.CONTENT_SCREEN_STATE:
        return Container();
      case StateRendererType.EMPTY_SCREEN_STATE:
        return _getItemsInColumn(
            [_getAnimatedImage('error_lottie.json'), _getMessage(message)]);

      default:
        return Container();
    }
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppFontSize.s100,
      width: AppFontSize.s100,
      child: Lottie.asset('assets/json/$animationName'), //json image,
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppFontSize.s18),
        child: Text(message,
            style: GoogleFonts.lato(
              color: ColorManager.black,
              fontSize: FontSizeManager.s16,
            )),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
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
            onPressed: () {
              if (stateRendererType ==
                  StateRendererType.FULL_SCREEN_ERROR_STATE) {
                retryActionFunction?.call(); // call inside the api
              } else {
                Get.back();
              }
            },
            child: Text(
              buttonTitle,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.s16,
              ),
            ),
          ),
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

  Widget _getPopupDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppFontSize.s16,
        ),
      ),
      elevation: AppFontSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            AppFontSize.s12,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: AppFontSize.s12,
              offset: Offset(0, AppFontSize.s12),
            ),
          ],
        ),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
