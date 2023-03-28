// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/mail_app/mail_app_dialog.dart';
import '../ui/dialogs/no_mail_app/no_mail_app_dialog.dart';

enum DialogType {
  infoAlert,
  noMailApp,
  mailApp,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.noMailApp: (context, request, completer) =>
        NoMailAppDialog(request: request, completer: completer),
    DialogType.mailApp: (context, request, completer) =>
        MailAppDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
