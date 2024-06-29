//TODO: to hold box styles
import 'package:books/app/config/app_colors.dart';
import 'package:books/app/config/app_dimens.dart';
import 'package:flutter/material.dart';

class ShapeStyles {
  static ShapeBorder rounded({
    BorderRadiusGeometry? borderRadius,
    double? radiusSize,
    Color? color,
    double? borderSize,
    bool withBorder = false,
  }) {
    return RoundedRectangleBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(radiusSize ?? AppDimens.roundedVer2Small),
      side: withBorder
          ? BorderSide(
              color: color ?? AppColors.defaultBorderButtonBorderColor,
              width: borderSize ?? AppDimens.defaultBorderShapeStyleRounded,
            )
          : BorderSide.none,
    );
  }
}
