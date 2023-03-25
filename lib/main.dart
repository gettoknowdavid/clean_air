import 'package:clean_air/app/app.bottomsheets.dart';
import 'package:clean_air/app/app.dart';
import 'package:clean_air/app/app.dialogs.dart';
import 'package:clean_air/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const CleanAirApp());
}
