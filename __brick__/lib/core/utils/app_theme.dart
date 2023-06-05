import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:{{package_name}}/core/config/app_colors.dart';
import 'package:{{package_name}}/core/utils/app_constansts.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    primarySwatch: AppColors.primaryMaterialCo,
    scaffoldBackgroundColor:
        kDebugMode ? AppColors.lightGrey : AppColors.scaffoldWhiteBg,
  ); //ThemeData.light();

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.appBackGroundColor,
    //scaffoldBackgroundColor: LmgColors.scaffoldBg,
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.appBackGroundColor,
    ),
  );

  static final BoxDecoration defaultCardDecoration = BoxDecoration(
    color: AppColors.white,
    borderRadius: const BorderRadius.all(AppConstants.borderRadius),
  );

  //ThemeData.dark();
}
