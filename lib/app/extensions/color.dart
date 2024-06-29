import 'package:flutter/material.dart';

extension HexColor on Colors {
  @pragma('vm:entry-point')
  static Color get(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "0xFF$hexColor";
    }
    int color = int.parse(hexColor);
    return Color(color);
  }
}
