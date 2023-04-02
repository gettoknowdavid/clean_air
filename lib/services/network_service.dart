import 'dart:async';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.snackbars.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NetworkService with ListenableServiceMixin {
  final _status = ReactiveValue<NetworkStatus>(NetworkStatus.disconnected);

  final _snackbarService = locator<SnackbarService>();

  NetworkService() {
    listenForChange();
  }

  NetworkStatus get status => _status.value;

  Future<void> checkConnectivity() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      _status.value = NetworkStatus.connected;
      _snackbarService.showCustomSnackBar(
        duration: const Duration(seconds: 6),
        variant: SnackbarType.networkOnline,
        message: 'Back Online',
      );
    } else {
      _status.value = NetworkStatus.disconnected;
      _snackbarService.showCustomSnackBar(
        duration: const Duration(seconds: 6),
        variant: SnackbarType.networkOffline,
        message: "You're Offline",
      );
    }
  }

  StreamSubscription<InternetConnectionStatus> listenForChange() {
    return InternetConnectionChecker().onStatusChange.listen((status) async {
      switch (status) {
        case InternetConnectionStatus.connected:
          _status.value = NetworkStatus.connected;

          break;
        case InternetConnectionStatus.disconnected:
          _status.value = NetworkStatus.disconnected;

          break;
      }
    });
  }

  @override
  void listenToReactiveValues(List reactiveValues) {
    super.listenToReactiveValues([_status]);
  }
}

enum NetworkStatus { connected, disconnected }
