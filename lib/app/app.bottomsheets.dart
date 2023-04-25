// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import '../ui/bottom_sheets/edit_profile/edit_profile_sheet.dart';
import '../ui/bottom_sheets/image_source/image_source_sheet.dart';
import 'app.locator.dart';

enum BottomSheetType {
  notice,
  createEvent,
  editProfile,
  imageSource,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.editProfile: (context, request, completer) =>
        EditProfileSheet(request: request, completer: completer),
    BottomSheetType.imageSource: (context, request, completer) =>
        ImageSourceSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
