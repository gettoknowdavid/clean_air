// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/air_quality_service.dart';
import '../services/auth_service.dart';
import '../services/favourites_service.dart';
import '../services/firestore_service.dart';
import '../services/media_service.dart';
import '../services/network_service.dart';
import '../services/open_mail_app_service.dart';
import '../services/secure_storage_service.dart';
import '../services/shared_preferences_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => NetworkService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => SecureStorageService());
  locator.registerLazySingleton(() => OpenMailAppService());
  locator.registerLazySingleton(() => AirQualityService());
  final sharedPreferencesService = await SharedPreferencesService.getInstance();
  locator.registerSingleton(sharedPreferencesService);

  locator.registerLazySingleton(() => FavouritesService());
  locator.registerLazySingleton(() => MediaService());
}
