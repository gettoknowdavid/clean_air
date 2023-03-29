// This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kFont = GoogleFonts.poppins().fontFamily;

class AppTheme {
  static get lightTheme {
    return FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: Color(0xff000000),
        primaryContainer: Color(0xffffffff),
        secondary: Color(0xffffffff),
        secondaryContainer: Color(0xff000000),
        tertiary: Color(0xff001f24),
        tertiaryContainer: Color(0xffffffff),
        appBarColor: Color(0xff000000),
        error: Color(0xffb00020),
      ),
      usedColors: 1,
      appBarStyle: FlexAppBarStyle.background,
      lightIsWhite: true,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 14,
        blendOnColors: false,
        defaultRadius: 20.0,
        elevatedButtonSchemeColor: SchemeColor.onPrimary,
        elevatedButtonSecondarySchemeColor: SchemeColor.primary,
        outlinedButtonSchemeColor: SchemeColor.onPrimaryContainer,
        outlinedButtonOutlineSchemeColor: SchemeColor.primary,
        bottomSheetElevation: 20.0,
        bottomSheetModalElevation: 20.0,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      fontFamily: kFont,
    );
  }

  static get darkTheme {
    return FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: Color(0xff000000),
        primaryContainer: Color(0xffffffff),
        secondary: Color(0xffffffff),
        secondaryContainer: Color(0xff080808),
        tertiary: Color(0xff262626),
        tertiaryContainer: Color(0xff000000),
        appBarColor: Color(0xff080808),
        error: Color(0xffcf6679),
      ),
      usedColors: 1,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 20,
      appBarStyle: FlexAppBarStyle.background,
      darkIsTrueBlack: true,
      swapColors: true,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 22,
        defaultRadius: 20.0,
        elevatedButtonSchemeColor: SchemeColor.onPrimary,
        elevatedButtonSecondarySchemeColor: SchemeColor.primary,
        outlinedButtonSchemeColor: SchemeColor.onPrimaryContainer,
        outlinedButtonOutlineSchemeColor: SchemeColor.primary,
        tabBarItemSchemeColor: SchemeColor.primary,
        tabBarIndicatorSchemeColor: SchemeColor.primary,
        bottomSheetElevation: 20.0,
        bottomSheetModalElevation: 20.0,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      fontFamily: kFont,
    );
  }
}
