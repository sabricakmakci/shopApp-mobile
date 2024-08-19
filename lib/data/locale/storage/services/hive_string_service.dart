
import '../hive_services_base.dart';

class HiveStringService extends HiveServiceBase<String> {
  static final HiveStringService _singleton = HiveStringService._internal();

  factory HiveStringService() {
    return _singleton;
  }

  HiveStringService._internal();
}
