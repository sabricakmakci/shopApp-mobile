import 'package:hive_flutter/hive_flutter.dart';
import 'secure_storage.dart';
import 'services/hive_bool_service.dart';
import 'services/hive_string_service.dart';

class HiveManager {
  static final HiveManager _instance = HiveManager._internal();
  static final HiveManager instance = _instance;
  HiveStringService stringService = HiveStringService();
  HiveBoolService boolService = HiveBoolService();
  SecureStorage secureStorageService = SecureStorage.instance;
  HiveManager._internal();

  Future<void> init() async {
    await Hive.initFlutter();
    await initializeService();
  }

  Future<void> initializeService() async {
    await HiveStringService().openBox();
    await HiveBoolService().openBox();
  }
}
