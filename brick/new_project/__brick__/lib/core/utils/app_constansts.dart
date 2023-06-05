import 'package:flutter/material.dart';
import 'package:{{package_name}}/core/config/app_dimensions.dart';

class AppConstants {
  static const Duration gridAnimDuration375 = Duration(milliseconds: 375);
  static const Duration listAnimDuration300 = Duration(milliseconds: 300);
  static const Duration animDuration300 = Duration(milliseconds: 300);
  static const Duration animDuration200 = Duration(milliseconds: 200);
  static const Duration animDuration100 = Duration(milliseconds: 100);
  static const Duration listShimmerAnimDuration800 =
      Duration(milliseconds: 800);

  static const double defaultScale = 0.5;
  static const Radius borderRadius = Radius.circular(8);
  static const BorderRadius borderRadiusCircular =
      BorderRadius.all(borderRadius);

  static const FontWeight headerFontWeight = FontWeight.w500;

  static final EdgeInsetsGeometry screenPrimaryPadding = EdgeInsets.symmetric(
    vertical: AppDimens.verticalPadding,
    horizontal: AppDimens.horizontalPadding,
  );
}
