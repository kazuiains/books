import 'package:flutter/material.dart';

class NavigationDrawerData {
  String? id;
  String? name;
  String? subName;
  Widget? leading;
  bool? selected;

  NavigationDrawerData({
    this.id,
    this.name,
    this.subName,
    this.leading,
    this.selected = false,
  });

  NavigationDrawerData copyWith({
    String? id,
    String? name,
    String? subName,
    Widget? leading,
    bool? selected,
  }) =>
      NavigationDrawerData(
        id: id ?? this.id,
        name: name ?? this.name,
        subName: subName ?? this.subName,
        leading: leading ?? this.leading,
        selected: selected ?? this.selected,
      );
}
