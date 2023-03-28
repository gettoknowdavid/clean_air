// This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
import 'package:clean_air/ui/common/app_colors.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static get lightTheme {
    return FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: kPrimaryColor,
        primaryContainer: kPrimaryContainerColor,
        secondary: kSecondaryColor,
        secondaryContainer: kSecondaryContainerColor,
        tertiary: kTertiaryColor,
        tertiaryContainer: kTertiaryContainerColor,
        appBarColor: kAppBarColor,
        error: kErrorLightColor,
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 2,
      lightIsWhite: true,
      surfaceTint: const Color(0xffffdcc3),
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 4,
        defaultRadius: 20.0,
        elevatedButtonSchemeColor: SchemeColor.onPrimary,
        elevatedButtonSecondarySchemeColor: SchemeColor.primary,
        dialogRadius: 30.0,
        timePickerDialogRadius: 30.0,
        dialogElevation: 10.0,
        bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
        bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.tertiary,
        bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
        bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.tertiary,
      ),
      useMaterial3ErrorColors: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      appBarElevation: 0,
      // To use the playground font, add GoogleFonts package and uncomment
      // fontFamily: GoogleFonts.notoSans().fontFamily,
    );
  }

  static get darkTheme {
    return FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: kPrimaryColor,
        primaryContainer: kPrimaryContainerColor,
        secondary: kSecondaryColor,
        secondaryContainer: kSecondaryContainerColor,
        tertiary: kTertiaryColor,
        tertiaryContainer: kTertiaryContainerColor,
        appBarColor: kAppBarColor,
        error: kErrorDarkColor,
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      appBarStyle: FlexAppBarStyle.scaffoldBackground,
      darkIsTrueBlack: true,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 18,
        defaultRadius: 20.0,
        elevatedButtonSchemeColor: SchemeColor.onPrimary,
        elevatedButtonSecondarySchemeColor: SchemeColor.primary,
        inputDecoratorSchemeColor: SchemeColor.primaryContainer,
        dialogRadius: 30.0,
        timePickerDialogRadius: 30.0,
        dialogElevation: 10.0,
        bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
        bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.tertiary,
        bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
        bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.tertiary,
      ),
      useMaterial3ErrorColors: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      appBarElevation: 0,
      // To use the Playground font, add GoogleFonts package and uncomment
      // fontFamily: GoogleFonts.notoSans().fontFamily,
    );
  }
}
