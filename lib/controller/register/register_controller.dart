import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/components/buttons/custom_loading_button.dart';

class RegisterController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RoundedLoadingButtonController signUpController = RoundedLoadingButtonController();
  FocusNode? fullNameNode;
  FocusNode? emailNode;
  FocusNode? passwordNode;
}
