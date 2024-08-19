import 'package:flutter/foundation.dart';

class Log {
  static void debugPrint(dynamic value) {
    if (kDebugMode) print(value);
  }
}
