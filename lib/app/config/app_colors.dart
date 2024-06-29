import 'package:flutter/material.dart';

class AppColors {
  /// color pallet

  static const Map<int, Color> blackColorList = <int, Color>{
    0: Color(0xffffffff),
    50: Color(0xfff5f5f5),
    100: Color(0xffe9e9e9),
    200: Color(0xffd9d9d9),
    300: Color(0xffc4c4c4),
    400: Color(0xff9d9d9d),
    500: Color(0xff7b7b7b),
    600: Color(0xff555555),
    700: Color(0xff434343),
    800: Color(0xff262626),
    900: Color(0xff000000)
  };

  static const Map<int, Color> buttonBlueColorList = <int, Color>{
    0: Color(0xffffffff),
    50: Color(0xffE3F2FD),
    100: Color(0xffBBDEFB),
    200: Color(0xff90CAF9),
    300: Color(0xff64B5F6),
    400: Color(0xff42A5F5),
    500: Color(0xff2196F3),
    600: Color(0xff1E88E5),
    700: Color(0xff1976D2),
    800: Color(0xff1565C0),
    900: Color(0xff0D47A1)
  };

  static const Map<int, Color> caribbeanGreenColorList = <int, Color>{
    0: Color(0xffffffff),
    50: Color(0xffddf6f1),
    100: Color(0xfface9d9),
    200: Color(0xff70dbc0),
    300: Color(0xff00cca7),
    400: Color(0xff00bf93),
    500: Color(0xff00b182),
    600: Color(0xff00a374),
    700: Color(0xff009164),
    800: Color(0xff008156),
    900: Color(0xff006339)
  };

  static Color deepCarminePink = const Color(0xffEB3B3B);
  static Color internationalOrange = const Color(0xffC6392A);

  static Color orange = const Color(0xfff09400);
  static Color vividGamboge = const Color(0xffFF9800);

  static Color lotion = const Color(0xffFCFCFC);
  static Color platinum = const Color(0xffE7E7E7);
  static Color lightGrey = const Color(0xffd3d3d3);
  static Color grey = const Color(0xff808080);

  static Color bananaMania = const Color(0xfffae2b2);

  /// opacity color

  static Color black12Percent = black.withOpacity(0.12);

  static Color grey10Percent = grey.withOpacity(0.10);

  static Color white1Percent = white.withOpacity(0.01);
  static Color white15Percent = white.withOpacity(0.15);
  static Color white25Percent = white.withOpacity(0.25);
  static Color white70Percent = white.withOpacity(0.70);
  static Color white85Percent = white.withOpacity(0.85);

  static Color primary15Percent = primary.withOpacity(.15);
  static Color primary33Percent = primary.withOpacity(.33);

  /// material color

  static MaterialColor buttonBlue = MaterialColor(
    toInt(buttonBlueColorList[500]),
    buttonBlueColorList,
  );
  static MaterialColor lightSkyBlue = MaterialColor(
    toInt(buttonBlueColorList[200]),
    buttonBlueColorList,
  );
  static MaterialColor blueDeFrance = MaterialColor(
    toInt(buttonBlueColorList[700]),
    buttonBlueColorList,
  );

  static MaterialColor caribbeanGreen = MaterialColor(
    toInt(caribbeanGreenColorList[300]),
    caribbeanGreenColorList,
  );
  static MaterialColor magicMint = MaterialColor(
    toInt(caribbeanGreenColorList[100]),
    caribbeanGreenColorList,
  );
  static MaterialColor munsell = MaterialColor(
    toInt(caribbeanGreenColorList[500]),
    caribbeanGreenColorList,
  );

  static MaterialColor white = MaterialColor(
    toInt(blackColorList[0]),
    blackColorList,
  );
  static MaterialColor lightSilver = MaterialColor(
    toInt(blackColorList[200]),
    blackColorList,
  );
  static MaterialColor spanishGray = MaterialColor(
    toInt(blackColorList[400]),
    blackColorList,
  );
  static MaterialColor cssGrey = MaterialColor(
    toInt(blackColorList[500]),
    blackColorList,
  );
  static MaterialColor davysGrey = MaterialColor(
    toInt(blackColorList[600]),
    blackColorList,
  );
  static MaterialColor arsenic = MaterialColor(
    toInt(blackColorList[700]),
    blackColorList,
  );
  static MaterialColor raisinBlack = MaterialColor(
    toInt(blackColorList[800]),
    blackColorList,
  );
  static MaterialColor black = MaterialColor(
    toInt(blackColorList[900]),
    blackColorList,
  );

  static MaterialColor primaryLight = buttonBlue;
  static MaterialColor primary = lightSkyBlue;
  static MaterialColor primaryDark = blueDeFrance;

  /// color ui

  static Color primaryLightColor = primaryLight;
  static Color primaryColor = primary;
  static Color primaryDarkColor = primaryDark;

  static Color bodyColor = white;
  static Color contentColor = white;
  static Color contentSpaceColor = platinum;

  // language color
  static Color defaultLanguageIndonesiaColor = internationalOrange;
  static Color defaultLanguageEnglishColor = buttonBlue;

  // modal color
  static Color defaultModalSuccessColor = caribbeanGreen;
  static Color defaultModalErrorColor = internationalOrange;
  static Color defaultModalWarningColor = vividGamboge;
  static Color defaultModalColor = davysGrey;
  static Color defaultModalDescriptionColor = cssGrey;

  // snack bar color
  static Color defaultSnackBarSuccessColor = caribbeanGreen;
  static Color defaultSnackBarErrorColor = internationalOrange;
  static Color defaultSnackBarWarningColor = vividGamboge;
  static Color defaultSnackBarColor = raisinBlack;
  static Color defaultSnackBarButtonTextColor = lightSilver;
  static Color defaultSnackBarMessageColor = grey;

  // button color
  static Color defaultButtonActiveColor = primary;
  static Color defaultButtonDisableColor = primaryLight;
  static Color defaultBorderButtonTextColor = primary;
  static Color defaultBorderButtonBorderColor = primary;
  static Color defaultButtonDeleteColor = deepCarminePink;
  static Color defaultButtonOverlayColor = black12Percent;

  // capsule button color
  static Color defaultCapsuleButtonBackgroundColor = primary;
  static Color defaultCapsuleButtonContentColor = white;

  // flat icon button color
  static Color flatTextIconAssetButtonContentColor = white;

  // text field color
  static Color defaultTextFieldEnabledBorderColor = platinum;
  static Color defaultTextFieldFocusedErrorBorderColor = deepCarminePink;
  static Color defaultTextFieldErrorBorderColor = deepCarminePink;
  static Color defaultTextFieldDisabledBorderColor = platinum;
  static Color defaultTextFieldFocusedBorderColor = primary;
  static Color defaultTextFieldLabelColor = cssGrey;
  static Color defaultTextFieldHintColor = cssGrey;
  static Color defaultTextFieldFillColor = white;

  static Color defaultTextFieldCircleIconEnableBorderColor = white25Percent;
  static Color defaultTextFieldCircleIconErrorBorderColor = deepCarminePink;
  static Color defaultTextFieldCircleIconDisableBorderColor = platinum;
  static Color defaultTextFieldCircleIconFocusBorderColor = white;
  static Color defaultTextFieldCircleIconHintColor = white70Percent;
  static Color defaultTextFieldCircleIconFillColor = white15Percent;

  static Color defaultTextFieldCapsuleIconEnableBorderColor = platinum;
  static Color defaultTextFieldCapsuleIconErrorBorderColor = deepCarminePink;
  static Color defaultTextFieldCapsuleIconDisableBorderColor = grey;
  static Color defaultTextFieldCapsuleIconFocusBorderColor = primary;
  static Color defaultTextFieldCapsuleIconLabelColor = cssGrey;
  static Color defaultTextFieldCapsuleIconFillColor = white;

  // divider color
  static Color defaultDividerColor = black;

  // date picker color
  static MaterialColor defaultDatePickerColor = primaryDark;

  // checkbox color
  static Color defaultCheckboxEnableColor = platinum;
  static MaterialColor defaultCheckboxSelectedColor = primary;
  static Color defaultCheckboxDisableColor = platinum;

  // radioButton color
  static Color defaultRadioButtonEnableColor = platinum;
  static MaterialColor defaultRadioButtonSelectedColor = primary;
  static Color defaultRadioButtonDisableColor = platinum;

  /// gradient color

  static List<Color> primaryBackgroundGradientColor = [
    primaryLight,
    primary,
  ];

  /// color helper

  static int toInt(Color? color) {
    if (color != null) {
      return int.parse(color.toString().substring(6, 16));
    }
    return 0xffffffff;
  }
}
