import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:{{package_name}}/core/config/app_colors.dart';
import 'package:{{package_name}}/core/utils/app_size.dart';

class AppToast {
  static appCommonToast({required String message, Color? bcColor}) {
    /// If you want success flushbar then give true to success
    ///
    Fluttertoast.cancel();
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: bcColor,
      textColor: AppColors.white,
      fontSize: 12.fs,
    );
  }
}
