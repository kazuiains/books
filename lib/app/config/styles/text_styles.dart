import 'package:books/app/config/app_colors.dart';
import 'package:books/app/config/app_dimens.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle regular = const TextStyle(
    fontSize: AppDimens.defaultFontSize,
    height: AppDimens.defaultHeightText,
  );

  ///Style
  static TextStyle defaultLabelInputStyleField = TextStyle(
    color: AppColors.defaultTextFieldLabelColor,
  );

  static TextStyle defaultHintInputStyleField = regular.copyWith(
    color: AppColors.defaultTextFieldHintColor,
  );

  static TextStyle defaultTextThemeStyleMenuTp = regular;
}
