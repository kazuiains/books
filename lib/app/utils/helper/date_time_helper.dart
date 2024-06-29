import 'package:books/app/core/data/widget/menu_data.dart';
import 'package:books/app/utils/helper/preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  static locale() {
    Locale language = PreferenceHelper.language()!;
    return language.languageCode;
  }

  static DateTime datePlus({
    int year = 0,
    int month = 0,
    int day = 0,
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  }) {
    DateTime current = DateTime.now();
    return DateTime(
      current.year + year,
      current.month + month,
      current.day + day,
      current.hour + hour,
      current.minute + minute,
      current.second + second,
      current.millisecond + millisecond,
      current.microsecond + microsecond,
    );
  }

  static DateTime dateMinus({
    int year = 0,
    int month = 0,
    int day = 0,
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  }) {
    DateTime current = DateTime.now();
    return DateTime(
      current.year - year,
      current.month - month,
      current.day - day,
      current.hour - hour,
      current.minute - minute,
      current.second - second,
      current.millisecond - millisecond,
      current.microsecond - microsecond,
    );
  }

  static List<MenuData> months() {
    List<MenuData> result = [];
    for (var i = 1; i < 13; i++) {
      var dateNumber = DateFormat('MM').parse("$i");
      String dateName = DateFormat('MMMM', locale()).format(dateNumber);
      result.add(
        MenuData(id: "$i", name: dateName),
      );
    }
    return result;
  }

  static MenuData selectMonth({
    int? monthNumber,
  }) {
    int month = monthNumber ?? DateTime.now().month;
    List<MenuData> list = months();
    MenuData data = MenuData();

    for (var i in list) {
      if (i.id == "$month") {
        data = i;
      }
    }
    return data;
  }

  static String twoDigitsTime(int n) => n.toString().padLeft(2, '0');
}
