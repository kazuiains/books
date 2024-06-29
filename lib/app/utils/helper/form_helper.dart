import 'package:flutter/material.dart';
import 'package:books/app/config/app_strings.dart';

class FormHelper {
  static changeFocus({
    required BuildContext context,
    required FocusNode currentFocus,
    required FocusNode nextFocus,
  }) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static finishFocus({
    required BuildContext context,
    required FocusNode currentFocus,
    required Function function,
  }) {
    currentFocus.unfocus();
    function();
  }

  static unFocusAll() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  }

  static setValueSafeUnsafeForm(
    int maxNumber,
    String? value,
    TextEditingController? controller,
    bool autoFill,
  ) {
    if (value != null && autoFill) {
      if (value.isNotEmpty && !value.contains(AppStrings.defaultNullValue) && isNumeric(value)) {
        int primaryValue = int.parse(value);
        if (primaryValue >= 0 && primaryValue <= maxNumber) {
          int secondaryValue = maxNumber - primaryValue;
          controller?.text = secondaryValue.toString();
        }
      } else {
        controller?.text = AppStrings.defaultNaValue;
      }
    }
  }

  static bool isNumeric(String? value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }
}
