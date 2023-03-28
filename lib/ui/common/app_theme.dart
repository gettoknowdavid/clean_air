// This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
import 'package:flex_color_scheme/flex_color_scheme.dart';

class AppTheme {
  static get lightTheme {
    return FlexThemeData.light(
      scheme: FlexScheme.blue,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 9,
      appBarStyle: FlexAppBarStyle.scaffoldBackground,
      lightIsWhite: true,
      subThemesData: const FlexSubThemesData(
        defaultRadius: 20.0,
        elevatedButtonSchemeColor: SchemeColor.onPrimary,
        elevatedButtonSecondarySchemeColor: SchemeColor.primary,
        outlinedButtonSchemeColor: SchemeColor.onPrimaryContainer,
        outlinedButtonOutlineSchemeColor: SchemeColor.primary,
        bottomSheetElevation: 20.0,
        bottomSheetModalElevation: 20.0,
      ),
      keyColors: const FlexKeyColors(),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      appBarElevation: 0,
      // To use the playground font, add GoogleFonts package and uncomment
      // fontFamily: GoogleFonts.notoSans().fontFamily,
    );
  }

  static get darkTheme {
    return FlexThemeData.dark(
      scheme: FlexScheme.blue,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 15,
      appBarStyle: FlexAppBarStyle.scaffoldBackground,
      darkIsTrueBlack: true,
      swapColors: true,
      subThemesData: const FlexSubThemesData(
        defaultRadius: 20.0,
        outlinedButtonSchemeColor: SchemeColor.onPrimaryContainer,
        outlinedButtonOutlineSchemeColor: SchemeColor.primary,
        tabBarItemSchemeColor: SchemeColor.primary,
        tabBarIndicatorSchemeColor: SchemeColor.primary,
        bottomSheetElevation: 20.0,
        bottomSheetModalElevation: 20.0,
      ),
      keyColors: const FlexKeyColors(),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      appBarElevation: 0,
      // To use the Playground font, add GoogleFonts package and uncomment
      // fontFamily: GoogleFonts.notoSans().fontFamily,
    );
  }
}
