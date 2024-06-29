import 'dart:ui';

import 'package:books/app/core/data/preference/preference_data.dart';
import 'package:flutter/material.dart';
import 'package:books/app/config/app_colors.dart';
import 'package:books/app/config/app_strings.dart';
import 'package:books/app/config/localizations/translation_key.dart';

enum LanguageType {
  indonesia,
  english,
}

extension LanguageTypeItem on LanguageType {
  String get id {
    switch (this) {
      case LanguageType.indonesia:
        return AppStrings.languageIdIndonesia;
      case LanguageType.english:
        return AppStrings.languageIdEnglish;
    }
  }

  String get name {
    switch (this) {
      case LanguageType.indonesia:
        return language1;
      case LanguageType.english:
        return language2;
    }
  }

  String get language {
    switch (this) {
      case LanguageType.indonesia:
        return AppStrings.languageLanguageIndonesia;
      case LanguageType.english:
        return AppStrings.languageLanguageEnglish;
    }
  }

  String get country {
    switch (this) {
      case LanguageType.indonesia:
        return AppStrings.languageCountryIndonesia;
      case LanguageType.english:
        return AppStrings.languageCountryEnglish;
    }
  }

  Color get color {
    switch (this) {
      case LanguageType.indonesia:
        return AppColors.defaultLanguageIndonesiaColor;
      case LanguageType.english:
        return AppColors.defaultLanguageEnglishColor;
    }
  }

  PreferenceData get data {
    switch (this) {
      case LanguageType.indonesia:
        return PreferenceData(
          translatorId: LanguageType.indonesia.id,
          translatorName: LanguageType.indonesia.name,
          language: LanguageType.indonesia.language,
          country: LanguageType.indonesia.country,
          dynamicValue: LanguageType.indonesia,
        );
      case LanguageType.english:
        return PreferenceData(
          translatorId: LanguageType.english.id,
          translatorName: LanguageType.english.name,
          language: LanguageType.english.language,
          country: LanguageType.english.country,
          dynamicValue: LanguageType.english,
        );
    }
  }

  Locale get languageLocale {
    switch (this) {
      case LanguageType.indonesia:
        return Locale(
          LanguageType.indonesia.language,
        );
      case LanguageType.english:
        return Locale(
          LanguageType.english.language,
        );
    }
  }

  Locale get locale {
    switch (this) {
      case LanguageType.indonesia:
        return Locale(
          LanguageType.indonesia.language,
          LanguageType.indonesia.country,
        );
      case LanguageType.english:
        return Locale(
          LanguageType.english.language,
          LanguageType.english.country,
        );
    }
  }
}

selectLanguage(String? code) {
  if (code != null) {
    if (code == LanguageType.indonesia.id) {
      return LanguageType.indonesia.data;
    } else {
      return LanguageType.english.data;
    }
  }

  return LanguageType.english.data;
}

List<PreferenceData> get languages {
  List<PreferenceData> result = [];
  result.add(LanguageType.indonesia.data);
  result.add(LanguageType.english.data);
  return result;
}

List<Locale> get locales {
  List<Locale> result = [];
  result.add(LanguageType.indonesia.locale);
  result.add(LanguageType.english.locale);
  return result;
}

List<Locale> get languageLocales {
  List<Locale> result = [];
  result.add(LanguageType.indonesia.languageLocale);
  result.add(LanguageType.english.languageLocale);
  return result;
}
