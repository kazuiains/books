import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:books/app/config/app_colors.dart';
import 'package:books/app/config/localizations/translation_key.dart';

enum SnackBarType { success, error, warning, notification }

extension SnackBarItem on SnackBarType {
  String get title {
    switch (this) {
      case SnackBarType.success:
        return snackBarTitleSuccess.tr;
      case SnackBarType.error:
        return snackBarTitleError.tr;
      case SnackBarType.warning:
        return snackBarTitleWarning.tr;
      case SnackBarType.notification:
        return snackBarTitleNotification.tr;
    }
  }

  IconData get icon {
    switch (this) {
      case SnackBarType.success:
        return Icons.check_circle_outline;
      case SnackBarType.error:
        return Icons.cancel_outlined;
      case SnackBarType.warning:
        return Icons.error_outline;
      case SnackBarType.notification:
        return Icons.notifications_on_outlined;
    }
  }

  Color get color {
    switch (this) {
      case SnackBarType.success:
        return AppColors.defaultSnackBarSuccessColor;
      case SnackBarType.error:
        return AppColors.defaultSnackBarErrorColor;
      case SnackBarType.warning:
        return AppColors.defaultSnackBarWarningColor;
      case SnackBarType.notification:
        return AppColors.defaultSnackBarColor;
    }
  }
}
