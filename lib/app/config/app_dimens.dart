import 'package:flutter/material.dart';

class AppDimens {
  //// return Double
  static const double zeroValue = 0;
  static const double oneValue = 1;

  static const double paddingSmallest = 4.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 32.0;
  static const double paddingLargest = 64.0;

  static const double roundedVer1Small = 5.0;
  static const double roundedVer1Medium = 10.0;
  static const double roundedVer1Large = 15.0;

  static const double roundedVer2Small = 4.0;
  static const double roundedVer2Medium = 8.0;
  static const double roundedVer2Large = 16.0;

  static const int timeDigits = 2;
  static const int rpDigits = 3;

  /// Style

  // box style
  static const double defaultRoundedBoxStyleFloating = roundedVer2Medium;
  static const double defaultSpreadRadiusBoxStyleFloating = oneValue;
  static const double defaultBlurRadiusBoxStyleFloating = 10;

  // button style
  static const double defaultPaddingButtonStyleDialog = paddingMedium;
  static const double defaultRoundedButtonStyleDialog = roundedVer1Small;

  // shape style
  static const double defaultBorderShapeStyleRounded = 0.5;

  // system style
  static const double defaultOpacitySystemStyleOverlay = 0.002;

  /// Widget

  static const double defaultPaddingRadioButton = 15;
  static const double defaultSizeRadioButton = 18;

  static const double defaultPaddingCheckbox = 15;
  static const double defaultSizeCheckbox = 18;

  static const double defaultPaddingSwitch = 15;
  static const double defaultSizeSwitch = 40;

  static const double defaultSizeCircularProfile = 40;

  /// Height
  static const double splitScreenHeight = 323;

  /// text
  static const double defaultFontSize = 14;

  static const double defaultHeightText = 1.5;

  //// return Edge

  static const EdgeInsets edgeZero = EdgeInsets.zero;

  static const EdgeInsets edgeSmallest = EdgeInsets.all(4);
  static const EdgeInsets edgeSmall = EdgeInsets.all(8);
  static const EdgeInsets edgeMedium = EdgeInsets.all(16);
  static const EdgeInsets edgeLarge = EdgeInsets.all(32);
  static const EdgeInsets edgeLargest = EdgeInsets.all(64);

  /// Style

  //text field
  static const EdgeInsets edgeDefaultPaddingInputStyleField = EdgeInsets.only(
    left: 14,
    right: 14,
    top: 10,
    bottom: 10,
  );

  //// return Widget
  static const _sw2 = SizedBox(width: 2);
  static const _sw4 = SizedBox(width: 4);
  static const _sw5 = SizedBox(width: 5);
  static const _sw8 = SizedBox(width: 8);
  static const _sw10 = SizedBox(width: 10);
  static const _sw16 = SizedBox(width: 16);
  static const _sw20 = SizedBox(width: 20);
  static const _sw32 = SizedBox(width: 32);
  static const _sw64 = SizedBox(width: 64);

  static const _sh2 = SizedBox(height: 2);
  static const _sh4 = SizedBox(height: 4);
  static const _sh5 = SizedBox(height: 5);
  static const _sh8 = SizedBox(height: 8);
  static const _sh10 = SizedBox(height: 10);
  static const _sh16 = SizedBox(height: 16);
  static const _sh20 = SizedBox(height: 20);
  static const _sh32 = SizedBox(height: 32);
  static const _sh64 = SizedBox(height: 64);

  static const spacerHeightSmallest = _sh4;
  static const spacerHeightSmall = _sh8;
  static const spacerHeightMedium = _sh16;
  static const spacerHeightLarge = _sh32;
  static const spacerHeightLargest = _sh64;

  static const spacerWidthSmallest = _sw4;
  static const spacerWidthSmall = _sw8;
  static const spacerWidthMedium = _sw16;
  static const spacerWidthLarge = _sw32;
  static const spacerWidthLargest = _sw64;

  /// Widget

  //dialog
  static const spacerDialogIconTitle = _sw10;
  static const spacerDialogTitleDescription = _sh16;
  static const spacerDialogButton = _sw5;
}
