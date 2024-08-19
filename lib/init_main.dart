import 'package:shop_app_mobile/controller/add_new_card_controller/add_new_card_controller.dart';
import 'package:shop_app_mobile/controller/forgot_password/forgot_password_controller.dart';
import 'package:shop_app_mobile/controller/home/home_controller.dart';
import 'package:shop_app_mobile/controller/login/login_controller.dart';
import 'package:shop_app_mobile/controller/my_address/my_address_controller.dart';
import 'package:shop_app_mobile/controller/my_details/my_details_controller.dart';
import 'package:shop_app_mobile/controller/my_orders/my_orders_controller.dart';
import 'package:shop_app_mobile/controller/payment_methods_controller.dart/payment_methods_controller.dart';
import 'package:shop_app_mobile/controller/profile/profile_controller.dart';
import 'package:shop_app_mobile/controller/register/register_controller.dart';
import 'package:shop_app_mobile/core/controller/bottom_bar/bottom_bar_menu_controller.dart';
import 'package:shop_app_mobile/core/controller/language/language_controller.dart';
import 'package:shop_app_mobile/core/utils/log.dart';
import 'package:get/get.dart' as getx;
import 'core/controller/base/connectivity_controller.dart';
import 'core/utils/data_utils.dart';
import 'core/utils/helpers/device_information.dart';
import 'data/locale/storage/hive_manager.dart';

class InitMain {
  static Future<void> initController() async {
    await HiveManager.instance.init();
    DataUtils.deviceID = await DeviceInformation().getDeviceId();
    Log.debugPrint("Device ID: ${DataUtils.deviceID}");
    getx.Get.put(ConnectivityController());
    getx.Get.put(RegisterController());
    getx.Get.put(LoginController());
    getx.Get.put(ForgotPasswordController());
    getx.Get.put(BottomBarMenuController());
    getx.Get.put(HomeController());
    getx.Get.put(ProfileController());
    getx.Get.put(MyOrdersController());
    getx.Get.put(MyDetailsController());
    getx.Get.put(LanguageController());
    getx.Get.put(MyAddressController());
    getx.Get.put(PaymentMethodsController());
     getx.Get.put(AddNewCardController());
  }
}
