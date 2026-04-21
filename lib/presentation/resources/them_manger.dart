import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvmclean/presentation/resources/color_manger.dart';
import 'package:mvvmclean/presentation/resources/font_manger.dart';
import 'package:mvvmclean/presentation/resources/styles_mangers.dart';
import 'package:mvvmclean/presentation/resources/value_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorManger.primary,
    ),
    //main Colors
    primaryColor: ColorManger.primary,
    primaryColorLight: ColorManger.lightPrimary,
    primaryColorDark: ColorManger.darkPrimary,
    disabledColor: ColorManger.grey1,
    splashColor: ColorManger.lightPrimary, ////ripple efect color
    //card View theme
    cardTheme: CardThemeData(
      color: ColorManger.white,
      shadowColor: ColorManger.grey,
      elevation: AppSize.s4,
    ),

    //app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: AppSize.s4,
      shadowColor: ColorManger.lightPrimary,
      backgroundColor: ColorManger.primary,
      foregroundColor: ColorManger.white,
      titleTextStyle: getRegularStyle(
        color: ColorManger.white,
        fontSize: FontSize.s16,
      ),
    ),
    //button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManger.grey1,
      buttonColor: ColorManger.primary,
      splashColor: ColorManger.lightPrimary,
    ),
    // elevvated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManger.white,
          fontSize: FontSize.s17.sp,
        ),
        foregroundColor: ColorManger.white, // لون النص عندما يكون الزر enabled
        backgroundColor: ColorManger.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12.r),
        ), // RoundeRectangle
      ),
    ),
    //text theme
    textTheme: TextTheme(
      // displayLarge: getSemiboldStyle(
      //   color: ColorManger.darkGrey,
      //   fontSize: FontSize.s16,
      // ),

      // headlineLarge: getSemiboldStyle(
      //   color: ColorManger.darkGrey,
      //   fontSize: FontSize.s16,
      // ),

      // headlineMedium: getRegularStyle(
      //   color: ColorManger.darkGrey,
      //   fontSize: FontSize.s14,
      // ),

      // titleMedium: getMediumStyle(
      //   color: ColorManger.primary,
      //   fontSize: FontSize.s16,
      // ),
      // bodySmall: getRegularStyle(color: ColorManger.grey),

      // bodyMedium: getRegularStyle(
      //   color: ColorManger.primary,
      //   fontSize: FontSize.s16,
      // ), // TextField input text style

      // bodyLarge: getRegularStyle(color: ColorManger.grey1), //caption
      displayLarge: getSemiboldStyle(
        color: ColorManger.darkGrey,
        fontSize: FontSize.s16.sp,
      ),

      displayMedium: getSemiboldStyle(
        color: ColorManger.primary,
        fontSize: FontSize.s20.sp,
      ),
      headlineLarge: getSemiboldStyle(
        color: ColorManger.darkGrey,
        fontSize: FontSize.s16.sp,
      ),
      headlineMedium: getRegularStyle(
        color: ColorManger.darkGrey,
        fontSize: FontSize.s14.sp,
      ),
      titleMedium: getMediumStyle(
        color: ColorManger.primary,
        fontSize: FontSize.s16.sp,
      ),
      titleSmall: getRegularStyle(
        color: ColorManger.white,
        fontSize: FontSize.s16.sp,
      ),
      bodyLarge: getRegularStyle(
        color: ColorManger.grey1,
        fontSize: FontSize.s12.sp,
      ),
      bodySmall: getRegularStyle(
        color: ColorManger.grey,
        fontSize: FontSize.s12.sp,
      ),
      labelSmall: getBoldStyle(
        color: ColorManger.primary,
        fontSize: FontSize.s12.sp,
      ),
      headlineSmall: getRegularStyle(
        color: ColorManger.grey2,
        fontSize: FontSize.s12.sp,
      ),
      displaySmall: getRegularStyle(
        color: ColorManger.grey2,
        fontSize: FontSize.s16.sp,
      ),
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      //content padding
      contentPadding: EdgeInsets.all(AppPadding.p8),
      //hiny Style
      hintStyle: getRegularStyle(
        color: ColorManger.grey,
        fontSize: FontSize.s14.sp,
      ),
      //label Style
      labelStyle: getRegularStyle(
        color: ColorManger.grey,
        fontSize: FontSize.s16.sp,
      ),

      //error Style
      errorStyle: getRegularStyle(color: ColorManger.error),
      //enable border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.lightGrey, width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
      ),
      //focused border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.primary, width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
      ),
      //error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.error, width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
      ),
      //focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.primary, width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s16)),
      ),
    ),
  );
}
