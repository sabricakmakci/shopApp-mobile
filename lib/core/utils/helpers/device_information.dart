import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:uuid/uuid.dart';

import '../../../data/locale/storage/hive_service.dart';
import '../constants/hive_constants.dart';

class DeviceInformation {
  Future<AndroidDeviceInfo> getAndroidInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    return deviceInfo.androidInfo;
  }

  Future<IosDeviceInfo> getIosInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    return deviceInfo.iosInfo;
  }

  Future<String> getDeviceId() async {
    try {
      final deviceId = await HiveService().getSecurityString(HiveKeys.deviceId);
      if (deviceId != null && deviceId.isNotEmpty) {
        return deviceId;
      }
      final uuID = const Uuid().v4();
      if (Platform.isAndroid) {
        final androidInfo = await getAndroidInfo();
        await HiveService().setSecurityString(HiveKeys.deviceId, androidInfo.id);
        return androidInfo.id;
      } else if (Platform.isIOS) {
        final deviceInfo = await getIosInfo();
        final iosinfo = deviceInfo;
        await HiveService().setSecurityString(HiveKeys.deviceId, iosinfo.identifierForVendor ?? uuID);
        return iosinfo.identifierForVendor ?? uuID;
      } else {
        return uuID;
      }
    } catch (e) {
      return "Unknown";
    }
  }
}
