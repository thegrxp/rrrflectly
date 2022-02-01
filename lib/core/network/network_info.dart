import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rrrflectly/service_locator.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  Connectivity connectionChecker = serviceLocator<Connectivity>();

  @override
  Future<bool> get isConnected async {
    if (Platform.isMacOS) return true;

    final result = await connectionChecker.checkConnectivity();
    if (result == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}