import 'package:{{package_name}}/core/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final Widget child;
  const AppShimmer({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.baseShimmer,
      highlightColor: AppColors.highlightShimmer,
      child: child,
    );
  }
}

class TextShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  const TextShimmer({
    Key? key,
    this.height,
    this.width,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(
            radius ?? 3,
          ),
        ),
      ),
    );
  }
}
