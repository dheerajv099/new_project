import 'package:flutter/material.dart';
import 'package:{{package_name}}/core/config/app_colors.dart';
import 'package:{{package_name}}/core/utils/app_size.dart';

abstract class AppFS {
  /// Default font family
  static const String defaultFontOfApp = 'Poppins';
  static const String _defaultFontFamily = defaultFontOfApp;
  //static var defaultFontColor = LmgColors().fontBlack;

  static TextStyle style(
    int size, {
    Color? fontColor,
    String? fontFamily,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    double? lineHeight,
    double? letterSpacing,
  }) {
    final defaultFontColor = AppColors().textTheme;
    const defaultFontWeight = FontWeight.w400;
    const defaultLetterSpacing = 0.5;
    TextStyle appTextStyle(double fontSize, {double? height}) => TextStyle(
        fontFamily: fontFamily ?? _defaultFontFamily,
        fontSize: fontSize.fs,
        height: height ?? lineHeight,
        decoration: decoration,
        letterSpacing: letterSpacing ?? defaultLetterSpacing,
        fontWeight: fontWeight ?? defaultFontWeight,
        color: fontColor ?? defaultFontColor);

    switch (size) {
      case 0:
        return appTextStyle(0, height: 0);
      case 6:
        return appTextStyle(7);
      case 8:
        return appTextStyle(9); //7.5.sp
      case 10:
        return appTextStyle(9.6); //8.sp
      case 12:
        return appTextStyle(12); //10.sp
      case 14:
        return appTextStyle(13.2); //11.sp
      case 16:
        return appTextStyle(14.4); //12.sp
      case 18:
        return appTextStyle(16.8); //14.sp
      case 20:
        return appTextStyle(18);
      case 22:
        return appTextStyle(20.4); //17.sp
      case 24:
        return appTextStyle(22.6); //17.sp
      case 26:
        return appTextStyle(24); //20.sp
      case 32:
        return appTextStyle(26.4); //22.sp
      case 40:
        return appTextStyle(36); //30.sp
      default:
        return appTextStyle(10.5); //12
    }
  }
}
