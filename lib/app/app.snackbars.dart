import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';

const _icon = Icon(Icons.info, color: Colors.white, size: 20);

Future<void> setupSnackbarUI() async {
  await locator.allReady();
  SnackbarService snackbarService = locator<SnackbarService>();

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      backgroundColor: const Color(0xffb00020),
      textColor: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      icon: _icon,
    ),
  );

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.GROUNDED,
      icon: _icon,
    ),
  );

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.networkOnline,
    config: SnackbarConfig(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      padding: EdgeInsets.zero,
      borderRadius: 5.0,
      maxWidth: 100,
      messageTextAlign: TextAlign.center,
    ),
  );

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.networkOffline,
    config: SnackbarConfig(
      backgroundColor: const Color(0xffb00020),
      textColor: Colors.white,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      padding: EdgeInsets.zero,
      borderRadius: 5.0,
      maxWidth: 100,
      messageTextAlign: TextAlign.center,
    ),
  );
}

/// The type of snackbar to show
enum SnackbarType { success, error, networkOffline, networkOnline }
