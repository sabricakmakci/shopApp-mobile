import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<bool> checkAndRequestPermission(Permission permission,
      {bool showError = false, bool isClick = false}) async {
    final status = await permission.status;
    if (status != PermissionStatus.granted) {
      final result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else if ((status == PermissionStatus.denied || status == PermissionStatus.permanentlyDenied) && isClick) {
        openAppSettings();
        return false;
      }
    } else if (status == PermissionStatus.granted) {
      return true;
    } else if (status == PermissionStatus.denied && showError) {
      return false;
    } else if (status == PermissionStatus.permanentlyDenied && isClick) {
      openAppSettings();
      return false;
    }
    return false;
  }

  static Future<bool> checkSystemGPSSettings() async {
    if (Platform.isAndroid) {
      return Geolocator.isLocationServiceEnabled();
    }
    return true;
  }
}
