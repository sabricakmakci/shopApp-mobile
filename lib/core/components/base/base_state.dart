import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

import '../../controller/base/connectivity_controller.dart';
import '../../utils/data_utils.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver {
  double dynamicHeight(double value) => MediaQuery.of(context).size.height * value;
  double dynamicWidth(double value) => MediaQuery.of(context).size.width * value;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.hidden:
        break;
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    DataUtils.globalContext = context;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  SizedBox spaceHeight(double height) => SizedBox(height: height);
  SizedBox spaceWidth(double width) => SizedBox(width: width);

  final ConnectivityController connectivityController = Get.find<ConnectivityController>();
  final RegisterController registerController = Get.find<RegisterController>();
  final LoginController loginController = Get.find<LoginController>();
  final ForgotPasswordController forgotPasswordController = Get.find<ForgotPasswordController>();
  final BottomBarMenuController bottomBarMenuController = Get.find<BottomBarMenuController>();
  final HomeController homeController = Get.find<HomeController>();
  final ProfileController profileController = Get.find<ProfileController>();
  final MyOrdersController myOrdersController = Get.find<MyOrdersController>();
  final MyDetailsController myDetailsController = Get.find<MyDetailsController>();
  final LanguageController languageController = Get.find<LanguageController>();
  final MyAddressController myAddressController = Get.find<MyAddressController>();
  final PaymentMethodsController paymentMethodsController = Get.find<PaymentMethodsController>();
  final AddNewCardController addNewCardController = Get.find<AddNewCardController>();
}
