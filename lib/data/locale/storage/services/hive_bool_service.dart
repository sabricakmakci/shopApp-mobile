
import '../hive_services_base.dart';

class HiveBoolService extends HiveServiceBase<bool> {
  static final HiveBoolService _singleton = HiveBoolService._internal();

  factory HiveBoolService() {
    return _singleton;
  }

  HiveBoolService._internal();
}
