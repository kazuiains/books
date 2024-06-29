import 'package:books/app/config/app_dimens.dart';
import 'package:books/app/config/app_strings.dart';
import 'package:intl/intl.dart';
import 'package:books/app/types/language_type.dart';

class NumFormatter {
  static String format(double value) {
    var formatted = NumberFormat.currency(
      locale: LanguageType.indonesia.language,
      symbol: '',
      decimalDigits: AppDimens.rpDigits,
    ).format(value).toString();

    return formatted;
  }

  static String formatPercent(double value) {
    if (value.isNaN || value.isInfinite) {
      return AppStrings.zeroValue;
    } else {
      var formatted = (value * 100).truncate() / 100;
      return formatted.toString();
    }
  }

  static double parse(String value) {
    return NumberFormat.currency(
      locale: LanguageType.indonesia.language,
      symbol: '',
    ).parse(value).toDouble();
  }
}
