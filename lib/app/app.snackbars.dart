import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';

/// The type of snackbar to show
enum SnackbarType {
  success,
  error,
}

void setupSnackbarUI() {
  final snackbarService = locator<SnackbarService>();

  final errorConfig = SnackbarConfig(
    backgroundColor: const Color(0xFFF44336),
    textColor: const Color(0xFFFFFFFF),
    mainButtonTextColor: const Color(0xFF000000),
    borderRadius: 16,
    icon: const Icon(PhosphorIcons.infoFill, color: Colors.white),
    animationDuration: const Duration(seconds: 6),
  );

  final successConfig = SnackbarConfig(
    backgroundColor: const Color(0xFF4CAF50),
    textColor: const Color(0xFFFFFFFF),
    mainButtonTextColor: const Color(0xFF000000),
    borderRadius: 16,
    icon: const Icon(PhosphorIcons.checkFill, color: Colors.white),
    animationDuration: const Duration(seconds: 6),
  );

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: errorConfig,
  );

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: successConfig,
  );
}
