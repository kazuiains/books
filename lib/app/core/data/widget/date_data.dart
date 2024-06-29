import 'package:flutter/material.dart';

class DateData {
  String? id;
  String? text;
  dynamic data;
  DateTime? date;
  DateTimeRange? rangeDate;
  dynamic controller;

  DateData({
    this.id,
    this.text,
    this.data,
    this.date,
    this.rangeDate,
    this.controller,
  });

  DateData copyWith({
    String? id,
    String? text,
    dynamic data,
    DateTime? date,
    DateTimeRange? rangeDate,
    dynamic controller,
  }) =>
      DateData(
        id: id ?? this.id,
        text: text ?? this.text,
        data: data ?? this.data,
        date: date ?? this.date,
        rangeDate: rangeDate ?? this.rangeDate,
        controller: controller ?? this.controller,
      );
}
