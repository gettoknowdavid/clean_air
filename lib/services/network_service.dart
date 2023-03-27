import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkService {
  static final NetworkService _instance = NetworkService._internal();

  factory NetworkService() {
    return _instance;
  }

  NetworkService._internal();

  Stream<NetworkStatus> get onConnectionChange {
    return InternetConnectionChecker().onStatusChange.map((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          return NetworkStatus.connected;
        case InternetConnectionStatus.disconnected:
          return NetworkStatus.disconnected;
      }
    });
  }

  Future<NetworkStatus> get status async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      final bool hasInternet = await InternetConnectionChecker().hasConnection;
      if (hasInternet) {
        return NetworkStatus.connected;
      } else {
        return NetworkStatus.disconnected;
      }
    } else {
      return NetworkStatus.disconnected;
    }
  }
}

enum NetworkStatus { connected, disconnected }
