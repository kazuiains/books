import 'dart:io';

import 'package:books/app/core/data/preference/preference_data.dart';
import 'package:books/app/types/language_type.dart';
import 'package:flutter/material.dart';

class PreferenceHelper {
  static Locale? language({
    String? languageKey,
  }) {
    String? currentLanguage = Platform.localeName;

    PreferenceData selectedLocale = selectLanguage(currentLanguage);
    LanguageType type = selectedLocale.dynamicValue;

    return Locale(
      type.language,
      type.country,
    );
  }
}
