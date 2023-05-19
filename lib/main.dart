import 'package:clean_air/app/app.bottomsheets.dart';
import 'package:clean_air/app/app.dart';
import 'package:clean_air/app/app.dialogs.dart';
import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await setupLocator();
  setupDialogUi();
  await setupSnackbarUI();
  setupBottomSheetUi();
  await ThemeManager.initialise();

  runApp(const CleanAirApp());
}
