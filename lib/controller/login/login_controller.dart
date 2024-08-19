import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_mobile/core/utils/route/route.dart';

import '../../core/components/buttons/custom_loading_button.dart';

class LoginController extends GetxController {
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();

  RoundedLoadingButtonController loginController = RoundedLoadingButtonController();
  FocusNode? emailLoginNode;
  FocusNode? paswordLoginNode;

  Future<void> login() async {
    try {
      StaticRoute.goBottomBar();
    } finally {}
  }
}
