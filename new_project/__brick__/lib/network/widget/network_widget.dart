import 'package:flutter/material.dart';
import 'package:{{package_name}}/core/config/app_colors.dart';
import 'package:{{package_name}}/core/utils/app_font_style.dart';
import 'package:{{package_name}}/core/utils/app_size.dart';
import 'package:{{package_name}}/network/network_mixin.dart';

class NetWorkWidgetHandler extends StatefulWidget {
  const NetWorkWidgetHandler({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  State<NetWorkWidgetHandler> createState() => _NetWorkWidgetHandlerState();
}

class _NetWorkWidgetHandlerState extends State<NetWorkWidgetHandler>
    with NetworkMixin {
  OverlayEntry? _overlayEntry;

  void _showNoInternetOverlay() {
    final horizontalPadding = 18.w;
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          bottom: 60.h,
          left: horizontalPadding,
          right: horizontalPadding,
          child: Container(
            height: 38.h,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 6.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.redAlert,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/cancel_round.png',
                  height: 25.w,
                  width: 25.w,
                ),
                SizedBox(
                  width: 10.w,
                ),
                DefaultTextStyle(
                  style: AppFS.style(
                    12,
                    fontColor: AppColors.white,
                  ),
                  child: const Text(
                    'No Internet',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    OverlayState? overlayState = Overlay.of(context);
    overlayState?.insert(_overlayEntry!);
  }

  void _hideNoInternetOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void onDisconnected() {
    _showNoInternetOverlay();
  }

  @override
  void onReconnected() {
    _hideNoInternetOverlay();
  }
}
