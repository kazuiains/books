//TODO: to hold button styles
import 'package:books/app/config/app_colors.dart';
import 'package:books/app/config/app_dimens.dart';
import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle defaultSnackBar({
    Color? color,
  }) {
    return ButtonStyle(
      overlayColor: WidgetStateProperty.all<Color>(
        color ?? AppColors.defaultSnackBarColor,
      ),
    );
  }

  static ButtonStyle defaultDialog({
    Color? backgroundColor,
    Color? overlayColor,
    Color? radiusColor,
    Size? minimumSize,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    RoundedRectangleBorder? shape,
  }) {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(
        backgroundColor ?? AppColors.white,
      ),
      overlayColor: WidgetStateProperty.all<Color>(
        overlayColor ?? AppColors.defaultButtonOverlayColor,
      ),
      padding: WidgetStateProperty.all(
        padding ?? const EdgeInsets.all(AppDimens.defaultPaddingButtonStyleDialog),
      ),
      minimumSize: WidgetStateProperty.all(
        minimumSize ??
            const Size(
              kMinInteractiveDimension,
              kMinInteractiveDimension,
            ),
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  borderRadius ?? AppDimens.defaultRoundedButtonStyleDialog,
                ),
              ),
              side: BorderSide(
                color: radiusColor ?? Colors.white,
              ),
            ),
      ),
    );
  }
}
