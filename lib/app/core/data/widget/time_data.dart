import 'package:flutter/material.dart';

class TimeData {
  String? id;
  String? text;
  dynamic data;
  TimeOfDay? time;
  dynamic controller;

  TimeData({
    this.id,
    this.text,
    this.data,
    this.time,
    this.controller,
  });

  TimeData copyWith({
    String? id,
    String? text,
    dynamic data,
    TimeOfDay? time,
    dynamic controller,
  }) =>
      TimeData(
        id: id ?? this.id,
        text: text ?? this.text,
        data: data ?? this.data,
        time: time ?? this.time,
        controller: controller ?? this.controller,
      );
}
