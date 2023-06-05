import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{package_name}}/core/theme/theme_preference.dart';
import 'package:{{package_name}}/core/user/user.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial()) {
    _init();
  }

  Future<void> _init() async {
    bool? theme = await ThemePrefs.getTheme();

    if (theme == null) {
      var brightness = SchedulerBinding.instance.window.platformBrightness;
      changeTheme(brightness == Brightness.dark);
      return;
    } else {
      changeTheme(theme);
    }
  }

  Future<void> changeTheme(bool isDarkTheme) async {
    if (isDarkTheme) {
      await _setDarkMode();
    } else {
      await _setLightMode();
    }
  }

  Future<void> _setLightMode() async {
    UserInfo.isDarkTheme = false;
    await ThemePrefs.setDarkTheme(false);
    emit(LightTheme());
  }

  Future<void> _setDarkMode() async {
    UserInfo.isDarkTheme = true;
    await ThemePrefs.setDarkTheme(true);
    emit(DarkTheme());
  }
}
