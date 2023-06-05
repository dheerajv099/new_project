import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:{{package_name}}/injection_container.dart';
import 'package:{{package_name}}/network/lmg_network_info.dart';

mixin NetworkMixin<T extends StatefulWidget> on State<T> {
  late final StreamSubscription<ConnectivityResult> _networkSubscription;
  late final NetworkInfo _networkInfo;

  void onReconnected();
  void onDisconnected() {}

  Future<void> _initConnectivity() async {
    late final ConnectivityResult result;
    try {
      result = await _networkInfo.checkConnectivity();
      var isConnected = result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.ethernet;
      if (!isConnected) {
        onDisconnected();
      }
    } on Exception catch (e) {
      log(e.toString());
    }

    if (!mounted) {
      return Future.value(null);
    }

    // _updateConnectionStatus(result);

    _networkSubscription = _networkInfo.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  @override
  void initState() {
    _networkInfo = sl();
    _initConnectivity();
    super.initState();
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi ||
        result == ConnectivityResult.ethernet) {
      onReconnected();
    } else {
      onDisconnected();
    }
  }

  void _cancelSubscription() {
    try {
      _networkSubscription.cancel();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void dispose() {
    _cancelSubscription();
    super.dispose();
  }
}
