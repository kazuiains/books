import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:books/app/config/app_colors.dart';
import 'package:books/app/config/localizations/translation_key.dart';

enum ModalType { success, error, warning }

extension ModalTypeItem on ModalType {
  String get title {
    switch (this) {
      case ModalType.success:
        return modalTitleSuccess.tr;
      case ModalType.error:
        return modalTitleError.tr;
      case ModalType.warning:
        return modalTitleWarning.tr;
    }
  }

  IconData get icon {
    switch (this) {
      case ModalType.success:
        return Icons.check_circle_outline;
      case ModalType.error:
        return Icons.cancel_outlined;
      case ModalType.warning:
        return Icons.error_outline;
    }
  }

  Color get color {
    switch (this) {
      case ModalType.success:
        return AppColors.defaultModalSuccessColor;
      case ModalType.error:
        return AppColors.defaultModalErrorColor;
      case ModalType.warning:
        return AppColors.defaultModalWarningColor;
    }
  }

  Color get colorButtonYes {
    switch (this) {
      case ModalType.success:
        return AppColors.defaultModalSuccessColor;
      case ModalType.error:
        return AppColors.defaultModalColor;
      case ModalType.warning:
        return AppColors.defaultModalWarningColor;
    }
  }

  Color get colorButtonNo {
    switch (this) {
      case ModalType.success:
        return AppColors.defaultModalColor;
      case ModalType.error:
        return AppColors.defaultModalErrorColor;
      case ModalType.warning:
        return AppColors.defaultModalColor;
    }
  }
}
