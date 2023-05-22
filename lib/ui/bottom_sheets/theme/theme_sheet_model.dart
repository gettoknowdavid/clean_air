import 'package:clean_air/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class ThemeSheetModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

  ThemeMode? selectedThemeMode(BuildContext context) {
    return getThemeManager(context).selectedThemeMode;
  }

  void setThemeMode(BuildContext context, ThemeMode mode) {
    ThemeManager themeManager = getThemeManager(context);
    themeManager.setThemeMode(mode);
    notifyListeners();
    _bottomSheetService.completeSheet(SheetResponse());
  }

  String getThemeModeName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return 'Dark Mode';
      case ThemeMode.light:
        return 'Light Mode';
      default:
        return 'System';
    }
  }

  IconData getIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return PhosphorIcons.regular.moon;
      case ThemeMode.light:
        return PhosphorIcons.regular.sun;
      default:
        return PhosphorIcons.regular.nut;
    }
  }
}
