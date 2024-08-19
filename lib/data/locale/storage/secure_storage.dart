import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final SecureStorage _instance = SecureStorage._internal();
  static final SecureStorage instance = _instance;
  SecureStorage._internal() {
    storage = const FlutterSecureStorage();
  }
  late FlutterSecureStorage storage;

  Future<String?>? read(String key) async {
    return storage.read(key: key);
  }

  void delete(String key) async {
    await storage.delete(key: key);
  }

  void deleteAll() async {
    await storage.deleteAll();
  }

  void write(String key, String value) async {
    await storage.write(key: key, value: value);
  }
}
