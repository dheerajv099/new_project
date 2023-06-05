import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:{{package_name}}/core/config/app_colors.dart';
import 'package:{{package_name}}/core/utils/app_constansts.dart';
import 'package:{{package_name}}/core/utils/app_font_style.dart';
import 'package:{{package_name}}/core/utils/app_size.dart';

/// [AppFlushBars] contains common flush bars
class AppFlushBars {
  AppFlushBars._();

  static appCommonFlushBar({
    required BuildContext context,
    required String message,
    required bool success,
  }) {
    /// If you want success flushbar then give true to success
    return Flushbar(
      messageText: Text(
        message,
        style: AppFS.style(
          12,
          fontColor: AppColors.white,
        ),
      ),
      icon: Image.asset(
        success
            ? 'assets/icons/done_round.png'
            : 'assets/icons/cancel_round.png',
        height: 25.w,
        width: 25.w,
      ),
      margin: EdgeInsets.all(
        18.w,
      ),
      backgroundColor: success ? AppColors.appPrimary : AppColors.redAlert,
      isDismissible: true,
      animationDuration: AppConstants.animDuration300,
      borderRadius: BorderRadius.circular(6),
      padding: EdgeInsets.symmetric(
        horizontal: 11.w,
        vertical: 9.h,
      ),
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
