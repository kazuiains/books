//TODO: to hold box styles
import 'package:books/app/config/app_colors.dart';
import 'package:books/app/config/app_dimens.dart';
import 'package:books/app/config/app_styles.dart';
import 'package:flutter/material.dart';

class ThemeStyles {
  static const bool useMaterial3 = false;

  /// Theme style for main app
  static ThemeData app() {
    return ThemeData(
      useMaterial3: useMaterial3,
      primarySwatch: AppColors.primary,
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.primaryLight,
      primaryColorDark: AppColors.primaryDark,
      scaffoldBackgroundColor: AppColors.bodyColor,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemStyles.systemOverlayStyle(),
      ),
    );
  }

  /// Theme style for widget Date Picker
  static Theme datePicker({
    Widget? child,
  }) {
    return Theme(
      data: ThemeData(
        useMaterial3: useMaterial3,
        primarySwatch: AppColors.defaultDatePickerColor,
        primaryColor: AppColors.defaultDatePickerColor,
        primaryColorLight: AppColors.defaultDatePickerColor,
        primaryColorDark: AppColors.defaultDatePickerColor,
      ),
      child: child ?? Container(),
    );
  }

  /// Theme style for widget Time Picker
  static Theme timePicker({
    Widget? child,
  }) {
    return Theme(
      data: ThemeData(
        useMaterial3: useMaterial3,
        primarySwatch: AppColors.defaultDatePickerColor,
        primaryColor: AppColors.defaultDatePickerColor,
        primaryColorLight: AppColors.defaultDatePickerColor,
        primaryColorDark: AppColors.defaultDatePickerColor,
      ),
      child: child ?? Container(),
    );
  }

  /// Theme style for widget Check Box
  static Theme checkbox({
    Widget? child,
    bool? removePaddingTitle,
    double? paddingTitle,
    bool setTheme = false,
  }) {
    return Theme(
      data: ThemeData(
        useMaterial3: useMaterial3,
        unselectedWidgetColor: AppColors.defaultCheckboxEnableColor,
        primarySwatch: AppColors.defaultCheckboxSelectedColor,
        disabledColor: AppColors.defaultCheckboxDisableColor,
      ),
      child: setTheme
          ? ListTileTheme(
              horizontalTitleGap: removePaddingTitle ?? true ? AppDimens.zeroValue : paddingTitle,
              child: child ?? Container(),
            )
          : child ?? Container(),
    );
  }

  /// Theme style for widget Radio Button
  static Theme radioButton({
    Widget? child,
    bool? removePaddingTitle,
    double? paddingTitle,
    bool setTheme = false,
  }) {
    return Theme(
      data: ThemeData(
        useMaterial3: useMaterial3,
        unselectedWidgetColor: AppColors.defaultRadioButtonEnableColor,
        primarySwatch: AppColors.defaultRadioButtonSelectedColor,
        disabledColor: AppColors.defaultRadioButtonDisableColor,
      ),
      child: setTheme
          ? ListTileTheme(
              horizontalTitleGap: removePaddingTitle ?? true ?  AppDimens.zeroValue : paddingTitle,
              child: child ?? Container(),
            )
          : child ?? Container(),
    );
  }

  /// Theme style for widget Switch Button
  static Theme switchButton({
    Widget? child,
    bool? removePaddingTitle,
    double? paddingTitle,
    bool setTheme = false,
  }) {
    return Theme(
      data: ThemeData(
        useMaterial3: useMaterial3,
        unselectedWidgetColor: AppColors.defaultRadioButtonEnableColor,
        primarySwatch: AppColors.defaultRadioButtonSelectedColor,
        disabledColor: AppColors.defaultRadioButtonDisableColor,
      ),
      child: setTheme
          ? ListTileTheme(
              horizontalTitleGap: removePaddingTitle ?? true ?  AppDimens.zeroValue : paddingTitle,
              child: child ?? Container(),
            )
          : child ?? Container(),
    );
  }

  /// Theme style for widget menu third party
  /// note
  /// if use material app v3
  /// change
  /// titleMedium: const TextStyle(
  ///     color: Colors.red, // <-- TextFormField input color
  /// ),
  /// to
  /// bodyLarge: const TextStyle(
  ///     color: Colors.red, // <-- TextFormField input color
  /// ),
  static Theme menuTp({
    Widget? child,
    EdgeInsetsGeometry? contentPadding,
    double? borderRadiusSize,
    Color? enableBorderSideColor,
    Color? focusedErrorBorderSideColor,
    Color? errorBorderSideColor,
    Color? disabledBorderSideColor,
    Color? focusedBorderSideColor,
    Color? fillColor,
    Color? hintColor,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    TextStyle? inputStyle,
  }) {
    return Theme(
      data: ThemeData(
        useMaterial3: useMaterial3,
        primarySwatch: AppColors.primary,
        primaryColor: AppColors.primary,
        primaryColorLight: AppColors.primaryLight,
        primaryColorDark: AppColors.primaryDark,
        scaffoldBackgroundColor: AppColors.bodyColor,
        inputDecorationTheme: InputStyles.fieldTheme(
          contentPadding: contentPadding,
          borderRadiusSize: borderRadiusSize,
          enableBorderSideColor: enableBorderSideColor,
          focusedErrorBorderSideColor: focusedErrorBorderSideColor,
          errorBorderSideColor: errorBorderSideColor,
          disabledBorderSideColor: disabledBorderSideColor,
          focusedBorderSideColor: focusedBorderSideColor,
          fillColor: fillColor,
          hintColor: hintColor,
          hintStyle: hintStyle,
          labelStyle: labelStyle,
        ),
        textTheme: TextTheme(
          titleMedium: inputStyle ?? TextStyles.defaultTextThemeStyleMenuTp,
        ),
      ),
      child: child ?? Container(),
    );
  }

  /// Theme style for widget Text Field. text field circle icon type
  static Theme textFieldCircleIcon({
    Widget? child,
  }) {
    return Theme(
      data: ThemeData(
        useMaterial3: useMaterial3,
        brightness: Brightness.dark,
        primarySwatch: AppColors.white,
      ),
      child: child ?? Container(),
    );
  }

  /// Theme style for widget Navigation Drawer
  static Theme itemNavigationDrawer({
    Widget? child,
    bool? removePaddingTitle,
    double? paddingTitle,
  }) {
    return Theme(
      data: ThemeData(
        useMaterial3: useMaterial3,
        unselectedWidgetColor: AppColors.defaultCheckboxEnableColor,
        primarySwatch: AppColors.defaultCheckboxSelectedColor,
        disabledColor: AppColors.defaultCheckboxDisableColor,
      ),
      child: ListTileTheme(
        horizontalTitleGap: removePaddingTitle ?? true ?  AppDimens.zeroValue : paddingTitle,
        child: child ?? Container(),
      ),
    );
  }
}
