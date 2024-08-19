import 'package:get/get.dart';
import 'package:shop_app_mobile/core/controller/bottom_bar/bottom_bar_menu_controller.dart';
import 'package:shop_app_mobile/core/utils/route/route.dart';

class ProfileController extends GetxController {
  BottomBarMenuController bottomBarMenuController = Get.find<BottomBarMenuController>();

  Future<void> logout() async {
    bottomBarMenuController.selectedIndex = 0.obs;
    StaticRoute.goLoginScreen();
  }
}
