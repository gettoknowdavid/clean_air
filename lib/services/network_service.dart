import 'dart:async';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NetworkService with ListenableServiceMixin {
  final _status = ReactiveValue<NetworkStatus>(NetworkStatus.connected);

  final _snackbarService = locator<SnackbarService>();

  NetworkService() {
    listenToReactiveValues([_status]);
    listenForChange();
  }

  NetworkStatus get status => _status.value;

  StreamSubscription<InternetConnectionStatus> listenForChange() {
    return InternetConnectionChecker().onStatusChange.listen((event) {
      switch (event) {
        case InternetConnectionStatus.connected:
          if (_status.value != NetworkStatus.connected) {
            _status.value = NetworkStatus.connected;
            _snackbarService.closeSnackbar();
            _snackbarService.showCustomSnackBar(
              message: 'Back online.',
              variant: SnackbarType.networkOnline,
              duration: const Duration(seconds: 6),
            );
          }
          break;

        default:
          _status.value = NetworkStatus.disconnected;
          _snackbarService.showCustomSnackBar(
            message: 'You are offline.',
            variant: SnackbarType.networkOffline,
            duration: const Duration(days: 1000),
          );
          break;
      }
    });
  }

  void onResume() {
    listenForChange();
  }

  void onPause() {
    listenForChange().cancel();
  }
}

enum NetworkStatus { connected, disconnected }
