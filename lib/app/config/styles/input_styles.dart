//TODO: to hold input styles
import 'package:books/app/config/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:books/app/config/app_colors.dart';
import 'package:books/app/config/app_styles.dart';

class InputStyles {
  static InputDecoration defaultField({
    Color? enableBorderSideColor,
    Color? focusedErrorBorderSideColor,
    Color? errorBorderSideColor,
    Color? disabledBorderSideColor,
    Color? focusedBorderSideColor,
    Color? fillColor,
    Color? hintColor,
    Color? labelColor,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    String? hint,
    String? label,
    String? counterText,
    double borderRadiusSize = AppDimens.roundedVer2Small,
    bool isDense = true,
    bool filled = true,
    Widget? suffixIcon,
    Widget? prefixIcon,
    InputBorder? enabledBorder,
    InputBorder? focusedErrorBorder,
    InputBorder? errorBorder,
    InputBorder? disabledBorder,
    InputBorder? focusedBorder,
    EdgeInsetsGeometry? contentPadding,
  }) {
    return InputDecoration(
      counterText: counterText,
      contentPadding: contentPadding ?? AppDimens.edgeDefaultPaddingInputStyleField,
      enabledBorder: enabledBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              borderRadiusSize,
            ),
            borderSide: BorderSide(
              color: enableBorderSideColor ?? AppColors.defaultTextFieldEnabledBorderColor,
            ),
          ),
      focusedErrorBorder: focusedErrorBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              borderRadiusSize,
            ),
            borderSide: BorderSide(
              color: focusedErrorBorderSideColor ?? AppColors.defaultTextFieldFocusedErrorBorderColor,
            ),
          ),
      errorBorder: errorBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              borderRadiusSize,
            ),
            borderSide: BorderSide(
              color: errorBorderSideColor ?? AppColors.defaultTextFieldErrorBorderColor,
            ),
          ),
      disabledBorder: disabledBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              borderRadiusSize,
            ),
            borderSide: BorderSide(
              color: disabledBorderSideColor ?? AppColors.defaultTextFieldDisabledBorderColor,
            ),
          ),
      focusedBorder: focusedBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              borderRadiusSize,
            ),
            borderSide: BorderSide(
              color: focusedBorderSideColor ?? AppColors.defaultTextFieldFocusedBorderColor,
            ),
          ),
      isDense: isDense,
      fillColor: fillColor ?? AppColors.defaultTextFieldFillColor,
      filled: filled,
      labelText: label,
      labelStyle: labelStyle ??
          TextStyles.defaultLabelInputStyleField.copyWith(
            color: labelColor,
          ),
      hintText: hint,
      hintStyle: hintStyle ??
          TextStyles.defaultHintInputStyleField.copyWith(
            color: hintColor,
          ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
    );
  }

  static InputDecorationTheme fieldTheme({
    Color? enableBorderSideColor,
    Color? focusedErrorBorderSideColor,
    Color? errorBorderSideColor,
    Color? disabledBorderSideColor,
    Color? focusedBorderSideColor,
    Color? fillColor,
    Color? hintColor,
    Color? labelColor,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    double? borderRadiusSize,
    bool isDense = true,
    bool filled = true,
    InputBorder? enabledBorder,
    InputBorder? focusedErrorBorder,
    InputBorder? errorBorder,
    InputBorder? disabledBorder,
    InputBorder? focusedBorder,
    EdgeInsetsGeometry? contentPadding,
  }) {
    borderRadiusSize = borderRadiusSize ?? AppDimens.roundedVer2Small;

    return InputDecorationTheme(
      contentPadding: contentPadding ?? AppDimens.edgeDefaultPaddingInputStyleField,
      enabledBorder: enabledBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              borderRadiusSize,
            ),
            borderSide: BorderSide(
              color: enableBorderSideColor ?? AppColors.defaultTextFieldEnabledBorderColor,
            ),
          ),
      focusedErrorBorder: focusedErrorBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              borderRadiusSize,
            ),
            borderSide: BorderSide(
              color: focusedErrorBorderSideColor ?? AppColors.defaultTextFieldFocusedErrorBorderColor,
            ),
          ),
      errorBorder: errorBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              borderRadiusSize,
            ),
            borderSide: BorderSide(
              color: errorBorderSideColor ?? AppColors.defaultTextFieldErrorBorderColor,
            ),
          ),
      disabledBorder: disabledBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              borderRadiusSize,
            ),
            borderSide: BorderSide(
              color: disabledBorderSideColor ?? AppColors.defaultTextFieldDisabledBorderColor,
            ),
          ),
      focusedBorder: focusedBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              borderRadiusSize,
            ),
            borderSide: BorderSide(
              color: focusedBorderSideColor ?? AppColors.defaultTextFieldFocusedBorderColor,
            ),
          ),
      isDense: isDense,
      fillColor: fillColor ?? AppColors.defaultTextFieldFillColor,
      filled: filled,
      labelStyle: labelStyle ??
          TextStyles.defaultLabelInputStyleField.copyWith(
            color: labelColor,
          ),
      hintStyle: hintStyle ??
          TextStyles.defaultHintInputStyleField.copyWith(
            color: hintColor,
          ),
    );
  }
}
