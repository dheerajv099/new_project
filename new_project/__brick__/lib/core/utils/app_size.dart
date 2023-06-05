import 'dart:ui';

extension CustomSize on num {

  double get _width => window.physicalSize.width / window.devicePixelRatio;
  double get _height => window.physicalSize.height / window.devicePixelRatio;

  /// Dynamic Height based on screen pixel ration
  double get h => this * (_height / 759);

  /// Dynamic Width based on screen pixel ration
  double get w => this * (_width / 360);

  /// Dynamic font Size based on screen pixel ration
  double get fs => (_width / 360) > 1.5 ? this * 1.5 : this * (_width / 360);

}
