// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/condition/condition_sheet.dart';
import '../ui/bottom_sheets/condition_info/condition_info_sheet.dart';
import '../ui/bottom_sheets/edit_profile/edit_profile_sheet.dart';
import '../ui/bottom_sheets/image_source/image_source_sheet.dart';
import '../ui/bottom_sheets/info/info_sheet.dart';
import '../ui/bottom_sheets/re_auth/re_auth_sheet.dart';
import '../ui/bottom_sheets/theme/theme_sheet.dart';

enum BottomSheetType {
  imageSource,
  editProfile,
  condition,
  info,
  theme,
  reAuth,
  conditionInfo,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.imageSource: (context, request, completer) =>
        ImageSourceSheet(request: request, completer: completer),
    BottomSheetType.editProfile: (context, request, completer) =>
        EditProfileSheet(request: request, completer: completer),
    BottomSheetType.condition: (context, request, completer) =>
        ConditionSheet(request: request, completer: completer),
    BottomSheetType.info: (context, request, completer) =>
        InfoSheet(request: request, completer: completer),
    BottomSheetType.theme: (context, request, completer) =>
        ThemeSheet(request: request, completer: completer),
    BottomSheetType.reAuth: (context, request, completer) =>
        ReAuthSheet(request: request, completer: completer),
    BottomSheetType.conditionInfo: (context, request, completer) =>
        ConditionInfoSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
