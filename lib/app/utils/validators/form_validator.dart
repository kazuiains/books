import 'package:books/app/config/app_strings.dart';
import 'package:books/app/config/localizations/translation_key.dart';
import 'package:books/app/utils/formatters/num_formatter.dart';
import 'package:books/app/utils/validators/email_validator.dart';
import 'package:get/get_utils/get_utils.dart';

class FormValidator {
  static String? notRequired(String? s, {String? errorMessage}) {
    return null;
  }

  static String? dynamicRequired(Object? s) {
    if (s == null) {
      return validatorMessageEmptyInput.tr;
    }
    return null;
  }

  static String? required(String? s, {String? errorMessage}) {
    if (s == null || s.isEmpty || s == AppStrings.nullTextValue) {
      return errorMessage ?? validatorMessageEmptyInput.tr;
    }
    return null;
  }

  static String? passwordValidator(String? s, {String? errorMessage}) {
    if (s == null || s.isEmpty || s == AppStrings.nullTextValue) {
      return errorMessage ?? validatorMessageEmptyInput.tr;
    } else {
      if (s.length < 6) {
        return validatorMessageMinimumPassword.tr;
      }
    }
    return null;
  }

  static String? confirmPassword(String? newPassword, String? confirm, {String? errorMessage}) {
    if (newPassword == null || newPassword.isEmpty || confirm == null || confirm.isEmpty) {
      return validatorMessageEmptyInput.tr;
    } else {
      if (newPassword != confirm) {
        return validatorMessageNewPasswordNotMatch.tr;
      }
    }
    return null;
  }

  static String? listRequired(List? s, {String? errorMessage}) {
    if (s == null || s.isEmpty) {
      return errorMessage ?? validatorMessageEmptyInput.tr;
    }
    return null;
  }

  static String? requiredWithNoErrorMessage(String? s, {String? errorMessage}) {
    if (s == null || s.isEmpty || s == AppStrings.nullTextValue) {
      return "";
    }
    return null;
  }

  static String? isPasswordMatch(String? s, String? ss, {String? errorMessage}) {
    if (s == null || s.isEmpty) {
      return errorMessage ?? validatorMessageEmptyInput.tr;
    }
    if (s != ss) {
      return errorMessage ?? validatorMessageNewPasswordNotMatch.tr;
    }
    return null;
  }

  static String? email(String? s, {String? errorMessage}) {
    if (s == null || s.isEmpty) {
      return errorMessage ?? validatorMessageEmptyInput.tr;
    } else {
      if (EmailValidator.validate(s)) {
        return null;
      }
      return errorMessage ?? validatorMessageInvalidFormat.tr;
    }
  }

  static String? emailNotRequired(String? s, {String? errorMessage}) {
    if (s == null || s.isEmpty) return null;
    if (EmailValidator.validate(s)) {
      return null;
    }
    return errorMessage ?? validatorMessageInvalidFormat.tr;
  }

  static String? alphaSpace(String? s, {String? errorMessage}) {
    RegExp rule = RegExp(r'^[a-zA-z]+(\s[a-zA-Z]+)*$');

    if (s == null || s.isEmpty) {
      return errorMessage ?? validatorMessageEmptyInput.tr;
    } else {
      if (rule.hasMatch(s)) {
        return null;
      }
      return errorMessage ?? validatorMessageInvalidFormat.tr;
    }
  }

  static String? numeric(String? s, {String? errorMessage}) {
    RegExp rule = RegExp(r'^[0-9]*$');

    if (s == null || s.isEmpty) {
      return errorMessage ?? validatorMessageEmptyInput.tr;
    } else {
      if (rule.hasMatch(s)) {
        return null;
      }
      return errorMessage ?? validatorMessageInvalidFormat.tr;
    }
  }

  static String? numericWithMinMax(String? s, int min, int max, {String? errorMessage}) {
    RegExp rule = RegExp(r'^[0-9]*$');

    if (s == null || s.isEmpty) {
      return errorMessage ?? validatorMessageEmptyInput.tr;
    } else {
      if (rule.hasMatch(s)) {
        if (int.parse(s) < min) {
          return errorMessage ?? validatorMessageMinInputNumeric.tr;
        } else if (int.parse(s) > max) {
          return errorMessage ?? validatorMessageMaxInputNumeric.tr;
        } else {
          return null;
        }
      }
      return errorMessage ?? validatorMessageInvalidFormat.tr;
    }
  }

  static String? numericDecimalWithMinMax(String? s, double min, double max, {String? errorMessage}) {
    RegExp rule = RegExp(r"^[0-9,]+$", caseSensitive: false);
    if (s == null || s.isEmpty) {
      return errorMessage ?? validatorMessageEmptyInput.tr;
    } else {
      if (rule.hasMatch(s)) {
        try {
          NumFormatter.parse(s);
          if (NumFormatter.parse(s) < min) {
            return errorMessage ?? validatorMessageMinInputNumeric.tr;
          } else if (NumFormatter.parse(s) > max) {
            return errorMessage ?? validatorMessageMaxInputNumeric.tr;
          } else {
            return null;
          }
        } catch (e) {
          return errorMessage ?? validatorMessageInvalidFormat.tr;
        }
      }
      return errorMessage ?? validatorMessageInvalidFormat.tr;
    }
  }

  static String? numericDecimalWithMinZero(String? s, {String? errorMessage}) {
    RegExp rule = RegExp(r"^[0-9,]+$", caseSensitive: false);
    if (s == null || s.isEmpty) {
      return errorMessage ?? validatorMessageEmptyInput.tr;
    } else {
      if (rule.hasMatch(s)) {
        try {
          NumFormatter.parse(s);
          if (NumFormatter.parse(s) <= 0) {
            return errorMessage ?? validatorMessageMinInputNumeric.tr;
          } else {
            return null;
          }
        } catch (e) {
          return errorMessage ?? validatorMessageInvalidFormat.tr;
        }
      }
      return errorMessage ?? validatorMessageInvalidFormat.tr;
    }
  }

  static String? numericDecimal(String? s, {String? errorMessage}) {
    RegExp rule = RegExp(r"^[0-9,]+$", caseSensitive: false);
    if (s == null || s.isEmpty) {
      return errorMessage ?? validatorMessageEmptyInput.tr;
    } else {
      if (rule.hasMatch(s)) {
        try {
          NumFormatter.parse(s);
        } catch (e) {
          return errorMessage ?? validatorMessageInvalidFormat.tr;
        }
        return null;
      }
      return errorMessage ?? validatorMessageInvalidFormat.tr;
    }
  }

  static String? numericDecimalNotRequired(String? s, {String? errorMessage}) {
    RegExp rule = RegExp(r"^[0-9,]+$");
    if (s == null || s.isEmpty) return null;
    if (rule.hasMatch(s)) {
      try {
        NumFormatter.parse(s);
      } catch (e) {
        return errorMessage ?? validatorMessageInvalidFormat.tr;
      }
      return null;
    }
    return errorMessage ?? validatorMessageInvalidFormat.tr;
  }

  static String? numericNotRequired(String? s, {String? errorMessage}) {
    RegExp rule = RegExp(r'^[0-9]*$');
    if (s == null || s.isEmpty) return null;
    if (rule.hasMatch(s)) {
      return null;
    }
    return errorMessage ?? validatorMessageInvalidFormat.tr;
  }

  static checkValueDropDown<T>({
    required T? value,
    required String? valueName,
    bool isString = false,
  }) {
    if (value != null && valueName != null && valueName.isNotEmpty) {
      if (isString) {
        return valueName;
      } else {
        return value;
      }
    }
    return null;
  }

  static checkMultiValueDropDown<T>(
    List<T>? value,
  ) {
    if (value != null && value.isNotEmpty) {
      return value;
    }
    return null;
  }
}
