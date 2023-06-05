import 'package:flutter/material.dart';
import 'package:{{package_name}}/core/config/config.dart';
import 'package:{{package_name}}/core/local_db/db_helper.dart';
import 'package:{{package_name}}/core/model/user.dart';
// import 'package:{{package_name}}/features/authentication/data/models/user_model.dart';
import 'package:{{package_name}}/injection_container.dart';

/// [UserInfo] contains user data like
///
/// deviceID, search history, language, pin code etc..
class UserInfo {
  static final DbHelper _dbHelper = sl();

  static String userName = 'user';
  static String accessToken = '';
  // static AppUser? appUser;

  static String? setLanguage;
  static String? setLanguageCountryCode;

  static bool isDarkTheme = false;

  /// [UserInfo.setUserData] method get all the data from preferences and
  /// store in variables of [UserInfo] class
  static Future<void> setUserData({bool? isLogin}) async {
    if (isLogin ?? false) {
      // final User user = sl();
      // final AppUser? userDetail = await user.getUserData();
      // if (userDetail != null) {
      //   appUser = userDetail;
      //   UserInfo.accessToken = _dbHelper.box.get(HiveKey.accessToken);
      // }
    }
    setData();
  }

  static setData() async {
    UserInfo.setLanguage = _dbHelper.box.get(HiveKey.setLanguage);
  }

  static bool get isLoggedIn {
    // if (UserInfo.appUser?.id != null) {
      return true;
    // }
    // return false;
  }

  // static int get getId => appUser!.id;

  static Future<void> logOut() async {
    await _dbHelper.box.delete(HiveKey.user);
    await _dbHelper.box.delete(HiveKey.userLogin);
    await _dbHelper.box.delete(HiveKey.accessToken);
    // UserInfo.appUser = null;
    UserInfo.accessToken = '';

    // if (context.mounted) {
    //   HotRestartController.performHotRestart(context);
    // }
  }
}
