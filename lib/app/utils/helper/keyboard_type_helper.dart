import 'dart:io';

import 'package:flutter/material.dart';

class KeyboardTypeHelper {
  static TextInputType keyNumber() {
    if (Platform.isIOS) {
      return const TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      );
    } else {
      return TextInputType.number;
    }
  }
}
