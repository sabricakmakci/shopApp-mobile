import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDetailsController extends GetxController {
  TextEditingController detailNameSurnameController = TextEditingController();
  TextEditingController detailEmailController = TextEditingController();
  TextEditingController detailBirthdayController = TextEditingController();
  TextEditingController detailGenderController = TextEditingController();
  TextEditingController detailPhoneController = TextEditingController();

  FocusNode? detailNameSurnameFocusNode;
  FocusNode? detailEmailFocusNode;
  FocusNode? detailBirthdayFocusNode;
  FocusNode? detailGenderFocusNode;
  FocusNode? detailPhoneFocusNode;
}
