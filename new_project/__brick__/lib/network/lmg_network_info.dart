import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<ConnectivityResult> get onConnectivityChanged;
  Future<ConnectivityResult> checkConnectivity();
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;
  NetworkInfoImpl(this._connectivity);

  @override
  Future<ConnectivityResult> checkConnectivity() =>
      _connectivity.checkConnectivity();

  @override
  Future<bool> get isConnected =>
      _connectivity.checkConnectivity().then((ConnectivityResult value) =>
      value == ConnectivityResult.mobile ||
          value == ConnectivityResult.wifi ||
          value == ConnectivityResult.ethernet);

  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;
}
