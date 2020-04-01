import 'package:flutter/material.dart';
import 'dark_theme.dart';
import 'light_theme.dart';
import 'text_theme.dart';
enum AppThemes {
  lightMode,
  darkMode,
}

class AppTheme {


  static ThemeData lightThemeData =
  themeData(colorScheme: lightColorScheme, fillColor: lightFillColor,focusColor: lightFocusColor);
  static ThemeData darkThemeData =
  themeData( colorScheme: darkColorScheme,fillColor: darkFillColor,focusColor: darkFocusColor);

  final appThemesData = {
    AppThemes.lightMode:lightThemeData,
    AppThemes.darkMode: darkThemeData
  };

  static ThemeData themeData({ColorScheme colorScheme, Color focusColor,Color fillColor}) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: textTheme.apply( bodyColor: fillColor),
      appBarTheme: AppBarTheme(
        textTheme: textTheme.apply(bodyColor: colorScheme.onPrimary,displayColor: fillColor),
        color: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        brightness: colorScheme.brightness,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      accentColor: colorScheme.primary,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          lightFillColor.withOpacity(0.80),
          darkFillColor,
        ),
        contentTextStyle: textTheme.subtitle1.apply(color: darkFillColor),
      ),
    );
  }

}
