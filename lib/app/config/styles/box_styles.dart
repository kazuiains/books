//TODO: to hold box styles
import 'package:books/app/config/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:books/app/config/app_colors.dart';

class BoxStyles {
  static Decoration floating({
    BorderRadius? borderRadius,
    double? radiusSize,
    Color? shadowColor,
    double? spreadRadius,
    double? blurRadius,
    Offset? offset,
    Color? color,
  }) {
    return BoxDecoration(
      borderRadius: borderRadius ??
          BorderRadius.all(
            Radius.circular(radiusSize ?? AppDimens.defaultRoundedBoxStyleFloating),
          ),
      boxShadow: [
        BoxShadow(
          color: shadowColor ?? AppColors.grey10Percent,
          spreadRadius: spreadRadius ?? AppDimens.defaultSpreadRadiusBoxStyleFloating,
          blurRadius: blurRadius ?? AppDimens.defaultBlurRadiusBoxStyleFloating,
          offset: offset ?? const Offset(AppDimens.zeroValue, AppDimens.zeroValue), // changes position of shadow
        ),
      ],
      color: color,
    );
  }

  static Decoration gradient({
    AlignmentGeometry begin = Alignment.topCenter,
    AlignmentGeometry end = Alignment.bottomCenter,
    List<Color>? colors,
    List<double>? stops,
    TileMode tileMode = TileMode.mirror,
    GradientTransform? transform,
  }) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: begin,
        end: end,
        colors: colors ?? AppColors.primaryBackgroundGradientColor,
        stops: stops,
        tileMode: tileMode,
        transform: transform,
      ),
    );
  }
}
