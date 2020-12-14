import 'package:flutter/material.dart';

const Color primary = Color(0xff282837);
const Color primaryDark = Color(0xff000011);
const Color textOnPrimary = Color(0xffffffff);

const Color secondary = Color(0xfffed200);
const Color secondaryDark = Color(0xffc6a100);
const Color textOnSecondary = Color(0xff282837);

final ThemeData lightTheme = ThemeData.from(
  colorScheme: const ColorScheme(
    primary: primary,
    onPrimary: textOnPrimary,
    primaryVariant: primaryDark,
    secondary: secondary,
    onSecondary: textOnSecondary,
    secondaryVariant: secondaryDark,
    surface: Colors.white,
    onSurface: Colors.black,
    background: Colors.white70,
    onBackground: Colors.black,
    error: Colors.redAccent,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
);
