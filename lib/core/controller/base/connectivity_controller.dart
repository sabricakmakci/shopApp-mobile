import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/data_utils.dart';
import '../../utils/log.dart';

class ConnectivityController extends GetxController {
  RxBool isOnline = false.obs;
  RxBool isFailServer = false.obs;
  late StreamSubscription<ConnectivityResult> _connectivitySubsriction;
  late Connectivity _connectivity;

  Future<void> initConnectivity() async {
    if (DataUtils.isTesting) return;
    try {
      _connectivity = Connectivity();
      await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      Log.debugPrint(e.toString());
    }
    await changeOnlineStat();
  }

  Future<void> changeOnlineStat() async {
    if (DataUtils.isTesting) {
      isOnline.value = true;
      return;
    }

    final isConnected = await _updateConnectionStatus();
    isOnline.value = isConnected;
    isFailServer.value = !isConnected;
  }

  Future<bool> _updateConnectionStatus() async {
    if (DataUtils.isTesting) return true;

    try {
      final result = await InternetAddress.lookup('google.com').timeout(const Duration(seconds: 4));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    } on TimeoutException catch (_) {
      return false;
    }
  }

  @override
  void onInit() {
    if (DataUtils.isTesting) {
      changeOnlineStat();
    }

    Worker(() async => initConnectivity(), "initConnectivity").call();
    _connectivitySubsriction = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      changeOnlineStat();
    });
    super.onInit();
  }

  @override
  void dispose() {
    _connectivitySubsriction.cancel();
    super.dispose();
  }
}
