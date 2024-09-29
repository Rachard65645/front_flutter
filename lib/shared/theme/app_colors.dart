import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xFF5ECE7B);
  static const Color secondary = Color(0xff056C99);
  static const Color darkblue = Color(0xff252B5C);
  static const Color black = Color(0xff000000); // 1D1F22
  static const Color black1 = Color(0xff1D1F22);
  static const Color white = Color(0xffFFFFFF);
  static const Color surfaceWhite = Color(0xffF5F4F8);
  static const Color orange = Color(0xff1C1C1C);
  static const Color gray = Color(0xff4B5563);
  static const Color grayText = Color(0xffA2A7AF);
  static const Color lightPrimary = Color(0xffFFF1EC);
  static const Color hintColor = Color(0xff676767);
  static const Color inputBorderColors = Color(0xffA8A8A9);
  static const Color inputFillColors = Color(0xffF3F3F3);
  static const Color iconColor = Color(0xff626262);

  static const Color gray200 = Color(0xffE5E7EB);
  static const Color gray100 = Color(0xffF3F4F6);
  static const Color gray50 = Color(0xFFD6D6D6);
  static const Color gray400 = Color(0xFFA0A0A0);

  static const Color red400 = Color(0xffB91C1C);
  static const Color green = Colors.green;

  static const Color gray300 = Color(0xffD1D5DB);

  static const ColorScheme colorScheme = ColorScheme(
    primary: AppColors.primary,
    secondary: AppColors.darkblue,
    surface: surfaceWhite,
    background: white,
    error: red400,
    onPrimary: black,
    onSecondary: black,
    onSurface: black,
    onBackground: black,
    onError: white,
    brightness: Brightness.light,
  );
}
