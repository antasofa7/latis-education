import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  static const Color primaryColor = Color(0xffFB9873);
  static const Color secondaryColor = Color(0xff4FBA6F);
  static const Color tertiary = Color(0xffBDD7D9);
  static const Color neutral100 = Colors.white;
  static const Color neutral200 = Color(0xffF6F7FB);
  static const Color neutral300 = Color(0xffC7CCE1);
  static const Color neutral500 = Color(0xffBDBDBD);
  static const Color neutral900 = Color(0xff252525);
  static const Color danger = Color(0xffCB3A31);

  static final themeData = ThemeData(
      primaryColor: primaryColor,
      colorScheme: const ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
          tertiary: tertiary,
          background: neutral100,
          onBackground: neutral900,
          surface: neutral100,
          onPrimaryContainer: neutral900,
          outline: neutral300,
          outlineVariant: neutral200,
          shadow: neutral500,
          error: danger),
      fontFamily: GoogleFonts.roboto().fontFamily,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontWeight: bold, color: neutral900),
        headlineSmall: TextStyle(fontWeight: semiBold, color: neutral900),
        titleMedium: TextStyle(color: neutral900),
        titleLarge: TextStyle(fontWeight: semiBold, color: neutral900),
        titleSmall: TextStyle(fontWeight: semiBold, color: primaryColor),
        bodyLarge: TextStyle(fontWeight: semiBold, color: neutral100),
        bodyMedium: TextStyle(fontWeight: medium, color: neutral900),
        bodySmall: TextStyle(fontSize: 10.0, color: neutral900),
        labelLarge:
            TextStyle(fontSize: 16.0, fontWeight: medium, color: primaryColor),
        labelMedium:
            TextStyle(fontSize: 14.0, fontWeight: regular, color: neutral900),
        labelSmall:
            TextStyle(fontSize: 12.0, fontWeight: regular, color: danger),
      ));
}
