import 'package:books/app/config/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:books/app/config/app_strings.dart';
import 'package:books/app/utils/helper/preference_helper.dart';

enum DateTimeFormat {
  dateTimeSystem1,
  dateTimeUI1,
  dateTimeUI2,
  dateTimeUI3,
  dateUI1,
  dateUI2,
  dateUI3,
  dateUI4,
  dateUI5,
  dateUI6,
  time1,
}

extension DateTimeFormatItem on DateTimeFormat {
  String get format {
    switch (this) {
      case DateTimeFormat.dateTimeSystem1:
        return "yyyy-MM-dd'T'HH:mm:ss";
      case DateTimeFormat.dateTimeUI1:
        return "dd MMMM yyyy, HH:mm";
      case DateTimeFormat.dateTimeUI2:
        return "dd MMMM yyyy HH:mm";
      case DateTimeFormat.dateTimeUI3:
        return "d MMM yyyy, HH:mm";
      case DateTimeFormat.dateUI1:
        return "EEEE, dd MMMM yyyy";
      case DateTimeFormat.dateUI2:
        return "dd MMMM yyyy";
      case DateTimeFormat.dateUI3:
        return "dd/MM/yyyy";
      case DateTimeFormat.dateUI4:
        return "dd-MM-yyyy";
      case DateTimeFormat.dateUI5:
        return "yyyy-MM-dd";
      case DateTimeFormat.dateUI6:
        return "d MMM yyyy";
      case DateTimeFormat.time1:
        return "HH:mm:ss";
    }
  }
}

class DateTimeFormatter {
  static locale() {
    Locale language = PreferenceHelper.language()!;
    return language.languageCode;
  }

  static String getDateTimeFromString({
    String? date,
    String? time,
    DateTimeFormat? fromFormat,
    DateTimeFormat? toFormat,
    DateTimeFormat? fromDateFormat,
    DateTimeFormat? fromTimeFormat,
  }) {
    DateTime? dateTimeSelected;

    if (date != null && date.isNotEmpty && time != null && time.isNotEmpty) {
      DateTime parsedDate;
      DateTime parsedTime;

      if (fromFormat != null) {
        parsedDate = DateFormat(fromFormat.format).parse(date);
        parsedTime = DateFormat(fromFormat.format).parse(date);
      } else if (fromDateFormat != null && fromTimeFormat != null) {
        parsedDate = DateFormat(fromDateFormat.format).parse(date);
        parsedTime = DateFormat(fromTimeFormat.format).parse(date);
      } else {
        parsedDate = DateTime.parse(date);
        parsedTime = DateTime.parse(time);
      }

      dateTimeSelected = DateTime(
        parsedDate.year,
        parsedDate.month,
        parsedDate.day,
        parsedTime.hour,
        parsedTime.minute,
        parsedTime.second,
        parsedTime.millisecond,
        parsedTime.microsecond,
      );
    } else if (date != null && date.isNotEmpty) {
      if (fromFormat != null) {
        dateTimeSelected = DateFormat(fromFormat.format).parse(date);
      } else if (fromDateFormat != null) {
        dateTimeSelected = DateFormat(fromDateFormat.format).parse(date);
      } else {
        dateTimeSelected = DateTime.parse(date);
      }
    } else if (time != null && time.isNotEmpty) {
      if (fromFormat != null) {
        dateTimeSelected = DateFormat(fromFormat.format).parse(time);
      } else if (fromTimeFormat != null) {
        dateTimeSelected = DateFormat(fromTimeFormat.format).parse(time);
      } else {
        dateTimeSelected = DateTime.parse(time);
      }
    }

    return dateTimeSelected != null
        ? getDateTime(
            dateTime: dateTimeSelected,
            format: toFormat,
          )
        : AppStrings.defaultNullValue;
  }

  static String getDateTime({
    DateTime? dateTime,
    DateTimeFormat? format,
  }) {
    if (dateTime != null) {
      return format != null
          ? DateFormat(
              format.format,
              locale(),
            ).format(dateTime)
          : DateFormat(
              DateTimeFormat.dateUI1.format,
              locale(),
            ).format(dateTime);
    }
    return AppStrings.defaultNullValue;
  }

  static String getTime(TimeOfDay time) {
    String twoDigits(int n) => n.toString().padLeft(AppDimens.timeDigits, AppStrings.zeroValue);
    return "${twoDigits(time.hour)}:${twoDigits(time.minute)}";
  }
}
