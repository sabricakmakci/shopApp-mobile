import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/components/buttons/custom_loading_button.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController forgotPasswordEmailController = TextEditingController();
  TextEditingController resetPasswordController = TextEditingController();
  TextEditingController resetPasswordConfirmController = TextEditingController();

  RoundedLoadingButtonController forgotPasswordButton = RoundedLoadingButtonController();
  FocusNode? forgorPasswordEmailNode;
  FocusNode? resetPasswordNode;
  FocusNode? resetPasswordConfirmNode;
}
