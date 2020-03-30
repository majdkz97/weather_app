import 'package:flutter/material.dart';

   Color darkFillColor = Colors.white;
   Color darkFocusColor = Colors.white.withOpacity(0.12);
   ColorScheme darkColorScheme = ColorScheme(
    primary: const Color(0xFFFF8383),
    primaryVariant: const Color(0xFF1CDEC9),
    secondary: const Color(0xFF4D1F7C),
    secondaryVariant: const Color(0xFF451B6F),
    background: const Color(0xFF241E30),
    surface: const Color(0xFF1F1929),
    onBackground: Colors.white.withOpacity(0.05),
    error: darkFillColor,
    onError: darkFillColor,
    onPrimary: darkFillColor,
    onSecondary: darkFillColor,
    onSurface: darkFillColor,
    brightness: Brightness.dark,
  );

