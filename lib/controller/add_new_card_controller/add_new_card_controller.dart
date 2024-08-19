import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddNewCardController extends GetxController {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  FocusNode? cardNumberFocusNode;
  FocusNode? expiryDateFocusNode;
  FocusNode? cvvFocusNode;
}
