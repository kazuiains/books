import 'package:books/app/config/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemStyles {
  //// via theme -start-

  /// function to change the status bar and navigation system bar via themes
  static SystemUiOverlayStyle systemOverlayStyle({
    Color? systemNavigationBarColor,
    Color? systemNavigationBarDividerColor,
    bool? systemNavigationBarContrastEnforced,
    Color? statusBarColor,
    Brightness? statusBarBrightness,
    Brightness? statusBarIconBrightness,
    bool? systemStatusBarContrastEnforced,
    Brightness? systemNavigationBarIconBrightness,
    bool isDark = false,
    bool withOpacity = true,
    double opacity = AppDimens.defaultOpacitySystemStyleOverlay,
  }) {
    if (isDark) {
      return SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: withOpacity
            ? systemNavigationBarColor?.withOpacity(opacity) ?? Colors.black.withOpacity(opacity)
            : systemNavigationBarColor ?? Colors.black,
        systemNavigationBarDividerColor: systemNavigationBarDividerColor,
        systemNavigationBarContrastEnforced: systemNavigationBarContrastEnforced,
        statusBarColor: statusBarColor ?? Colors.transparent,
        statusBarBrightness: statusBarBrightness ?? Brightness.light,
        statusBarIconBrightness: statusBarIconBrightness ?? Brightness.light,
        systemStatusBarContrastEnforced: systemStatusBarContrastEnforced,
        systemNavigationBarIconBrightness: systemNavigationBarIconBrightness ?? Brightness.light,
      );
    } else {
      return SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: withOpacity
            ? systemNavigationBarColor?.withOpacity(opacity) ?? Colors.white.withOpacity(opacity)
            : systemNavigationBarColor ?? Colors.white,
        systemNavigationBarDividerColor: systemNavigationBarDividerColor,
        systemNavigationBarContrastEnforced: systemNavigationBarContrastEnforced,
        statusBarColor: statusBarColor ?? Colors.transparent,
        statusBarBrightness: statusBarBrightness ?? Brightness.dark,
        statusBarIconBrightness: statusBarIconBrightness ?? Brightness.dark,
        systemStatusBarContrastEnforced: systemStatusBarContrastEnforced,
        systemNavigationBarIconBrightness: systemNavigationBarIconBrightness ?? Brightness.dark,
      );
    }
  }

  //// via theme -end-


  //// via code -start-

  /// function to change the status bar and navigation system bar via code
  static setSystemOverlayStyle({
    Color? systemNavigationBarColor,
    Color? systemNavigationBarDividerColor,
    bool? systemNavigationBarContrastEnforced,
    Color? statusBarColor,
    Brightness? statusBarBrightness,
    Brightness? statusBarIconBrightness,
    bool? systemStatusBarContrastEnforced,
    Brightness? systemNavigationBarIconBrightness,
    bool isDark = false,
    bool withOpacity = true,
    double opacity = AppDimens.defaultOpacitySystemStyleOverlay,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      systemOverlayStyle(
        systemNavigationBarColor: systemNavigationBarColor,
        systemNavigationBarDividerColor: systemNavigationBarDividerColor,
        systemNavigationBarContrastEnforced: systemNavigationBarContrastEnforced,
        statusBarColor: statusBarColor,
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness: statusBarIconBrightness,
        systemStatusBarContrastEnforced: systemStatusBarContrastEnforced,
        systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
        isDark: isDark,
        withOpacity: withOpacity,
        opacity: opacity,
      ),
    );
  }

  /// function for change display mode, whether fullscreen or other, via via code
  static Future<void> setModeScreen({
    bool isDefault = true,
    SystemUiMode? type,
    List<SystemUiOverlay>? overlays,
  }) {
    if (isDefault) {
      return SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
      );
    } else {
      return SystemChrome.setEnabledSystemUIMode(
        type ?? SystemUiMode.edgeToEdge,
        overlays: overlays,
      );
    }
  }

  /// function to change the screen orientation, whether landscape or portrait or something else, via code
  static Future<void> setOrientationScreen({
    bool auto = false,
    List<DeviceOrientation>? orientations,
  }) {
    if (auto) {
      return SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      return SystemChrome.setPreferredOrientations(
        orientations ??
            [
              DeviceOrientation.portraitUp,
            ],
      );
    }
  }

  //// via code -end-

  //// bundle function

  /// bundle function for the main system style of the apps
  static Future basic() async {
    setSystemOverlayStyle();
    return Future.wait(
      [
        setModeScreen(),
        setOrientationScreen(),
      ],
    );
  }
}
