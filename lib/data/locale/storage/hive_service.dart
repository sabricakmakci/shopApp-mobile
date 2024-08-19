import '../../../core/utils/constants/hive_constants.dart';
import 'hive_manager.dart';

class HiveService {
  Future<bool> getIsLogout() async {
    final firstRun = getBool(HiveKeys.isLogout);
    if (firstRun != null) {
      return firstRun;
    }
    return true;
  }

  Future<void> setBool(String key, bool value) async {
    await HiveManager.instance.boolService.setData(key: key, data: value);
  }

  bool? getBool(String key) {
    return HiveManager.instance.boolService.getData(key);
  }

  Future<void> setSecurityString(String key, String value) async {
    return HiveManager.instance.secureStorageService.write(key, value);
  }

  Future<String?> getSecurityString(String key) async {
    return HiveManager.instance.secureStorageService.read(key);
  }
}
