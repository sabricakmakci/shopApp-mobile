import 'package:get/get.dart';

class AppRouter {
  static Future<void> navigeToRemoveAll({
    required Function() page,
    required String routeName,
    dynamic arguments,
    Transition? transition,
    Duration? duration,
  }) async {
    Get.offAll(
      page,
      routeName: routeName,
      arguments: arguments,
    );
  }

  static Future<void> navigeToRemove({
    required Function() page,
    required String routeName,
    dynamic arguments,
    Transition? transition,
    Duration? duration,
  }) async {
    Get.off(
      page,
      routeName: routeName,
      arguments: arguments,
      duration: duration,
    );
  }

  static Future<void> navigeTo({
    required Function() page,
    required String routeName,
    dynamic arguments,
    Transition? transition,
    Duration? duration,
  }) async {
    Get.to(
      page,
      routeName: routeName,
      arguments: arguments,
      duration: duration,
    );
  }
}
