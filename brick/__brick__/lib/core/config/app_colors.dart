import 'package:flutter/material.dart';
import 'package:{{package_name}}/core/user/user.dart';

class AppColors {
  /// Blue app primary color [appPrimary]
  static const Color appPrimary = Color(0xFF08748C);

  /// white color [white]
  static Color white = const Color(0xFFffffff);

  /// black color [black]
  static Color black = const Color(0xFF000000);

  static const Color appBackGroundColor = Colors.black;

  /// black color [transparent]
  static const Color transparent = Color(0x00000000);

  /// Red border color [redAlert]
  static Color redAlert = const Color(0xFFD93025);

  /// grey border color [grey]
  static Color grey = const Color(0xFF838383);

  /// grey light border color [lightGrey]
  static Color lightGrey = const Color(0xFFCDCDCD);

  /// dart grey text color [textColor]
  static Color textColor = const Color(0xFF0A1926);

  /// dart grey icon color [darkGreyIconColor]
  static Color darkGreyIconColor = const Color(0xFF0A1926);

  /// dart grey icon color [dividerDrawerColor]
  static Color dividerDrawerColor = const Color(0xFFCDCDCD);

  /// dart grey text color [textColor]
  static Color highlight = const Color(0xFFF3F8F9);

  /// TextField shadow color [textFieldShadow]
  static Color textFieldShadow = const Color(0xff222121).withOpacity(0.06);

  /// Grey hint text color [greyA4]
  static Color greyA4 = const Color(0xFFA4A4A4);

  /// Red border color [redD2]
  static Color redD2 = const Color(0xFFD21717);

  /// green Active status color [green]
  static Color green = const Color(0xFF35B421);

  /// yellow draft status color [yellow]
  static Color yellow = const Color(0xFFEEB41F);

  /// blue paused status color [blue]
  static Color blue = const Color(0xFF2196F3);

  /// light blue bidding strategy color [lightBlue]
  static Color lightBlue = const Color(0xFF4EDDFD);

  /// light primary color for charts color [primaryLight]
  static Color primaryLight = const Color(0xFF23CCB7);

  /// red color for charts color [red]
  static Color red = const Color(0xFFF44437);

  /// Shimmer Base color [baseShimmer]
  static Color baseShimmer = Colors.grey[350]!;

  /// Shimmer Highlight color [highlightShimmer]
  static Color highlightShimmer = Colors.grey[200]!;

  /// All the below defined colors do not make static because it will be change
  /// when you change Theme

  /// Application Primary color
  Color primary1A = appPrimary;

  /// Font black color [fontBlack]
  Color fontBlack =
      UserInfo.isDarkTheme ? const Color(0xFFEAEAEA) : const Color(0xFF182627);

  /// Grey Border color [grey5D]
  Color grey5D =
      UserInfo.isDarkTheme ? const Color(0xFFA4A4A4) : const Color(0xFF5D6767);

  Color cardBackgroundColor =
      UserInfo.isDarkTheme ? const Color(0xFF252525) : const Color(0xFFffffff);

  Color primary1A2 =
      UserInfo.isDarkTheme ? const Color(0xFFEAEAEA) : appPrimary;

  static Color scaffoldWhiteBg = const Color(0xFFF9F9F9);

  static Color drawerShadowColor = const Color(0xFFE4E4E4);

  /// Scaffold background color [scaffoldBg]
  Color scaffoldBg =
      UserInfo.isDarkTheme ? const Color(0xFF182627) : scaffoldWhiteBg;

  /// Scaffold background color [scaffoldBg]
  Color textTheme = UserInfo.isDarkTheme ? const Color(0xFF182627) : textColor;

  Color customButton =
      UserInfo.isDarkTheme ? const Color(0xFFffffff) : const Color(0xff1A7182);

  /// Primary material color of the app
  static MaterialColor primaryMaterialCo =
      MaterialColor(0xff1A7182, _getSwatch(AppColors().primary1A2));

  /// Primary swatch of the application
  static Map<int, Color> _getSwatch(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = hslColor.lightness;

    /// if [500] is the default color, there are at LEAST five
    /// steps below [500]. (i.e. 400, 300, 200, 100, 50.) A
    /// divisor of 5 would mean [50] is a lightness of 1.0 or
    /// a color of #ffffff. A value of six would be near white
    /// but not quite.
    const lowDivisor = 6;

    /// if [500] is the default color, there are at LEAST four
    /// steps above [500]. A divisor of 4 would mean [900] is
    /// a lightness of 0.0 or color of #000000
    const highDivisor = 5;

    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;

    return {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    };
  }
}

