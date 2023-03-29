import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';

/// The type of snackbar to show
enum SnackbarType {
  success,
  error,
}

Future<void> setupSnackbarUI() async {
  await locator.allReady();
  SnackbarService snackbarService = locator<SnackbarService>();

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      backgroundColor: Colors.red,
      textColor: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      borderRadius: 48,
      icon: const Icon(
        Icons.info,
        color: Colors.white,
        size: 20,
      ),
    ),
  );

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.GROUNDED,
      borderRadius: 48,
      icon: const Icon(
        Icons.info,
        color: Colors.white,
        size: 20,
      ),
    ),
  );
}
