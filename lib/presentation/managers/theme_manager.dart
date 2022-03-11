import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/color_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/styles_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    // ripple color
    splashColor: ColorManager.primaryOpacity70,
    // will be used incase of disabled button for example
    colorScheme: ColorScheme.dark(secondary: ColorManager.grey),
    // card view theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppFontSize.s4),
    // App bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppFontSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: GoogleFonts.lato(
          color: ColorManager.white,
          fontSize: AppFontSize.s16,
          fontWeight: FontWeight.bold),
    ),
    // Button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primaryOpacity70),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppFontSize.s12),
        ),
      ),
    ),

    // Text theme
    textTheme: TextTheme(
        headline1: getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: AppFontSize.s16),
        subtitle1: getMediumStyle(
            color: ColorManager.lightGrey, fontSize: AppFontSize.s14),
        subtitle2: getMediumStyle(
            color: ColorManager.primary, fontSize: AppFontSize.s14),
        caption: getRegularStyle(color: ColorManager.grey1),
        bodyText1: getRegularStyle(color: ColorManager.grey)),
    // input decoration theme (text form field)

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // hint style
      hintStyle: getRegularStyle(color: ColorManager.grey1),

      // label style
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),
      // error style
      errorStyle: getRegularStyle(color: ColorManager.error),

      // enabled border
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.grey, width: AppFontSize.s1_5),
          borderRadius:
              const BorderRadius.all(Radius.circular(AppFontSize.s8))),

      // focused border
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppFontSize.s1_5),
          borderRadius:
              const BorderRadius.all(Radius.circular(AppFontSize.s8))),

      // error border
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppFontSize.s1_5),
          borderRadius:
              const BorderRadius.all(Radius.circular(AppFontSize.s8))),
      // focused error border
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppFontSize.s1_5),
          borderRadius:
              const BorderRadius.all(Radius.circular(AppFontSize.s8))),
    ),
  );
}
