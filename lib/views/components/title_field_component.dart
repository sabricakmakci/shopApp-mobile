import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shop_app_mobile/core/extension/string/image_path_extension.dart';

import '../../core/components/text/custom_text.dart';
import '../../core/components/text/custom_text_form_field.dart';
import '../../core/utils/constants/design_constant.dart';

enum TitleFieldType {
  normal,
  date,
  gender,
}

class TitleFieldComponent extends StatelessWidget {
  const TitleFieldComponent({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.title,
    required this.placeHolder,
    this.inputFormatter,
    required this.isPassword,
    this.validate,
    this.isShowPassEye,
    this.fieldType = TitleFieldType.normal, // New parameter for field type
    this.onGenderChanged, // New callback for gender change
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String title;
  final String placeHolder;
  final List<TextInputFormatter>? inputFormatter;
  final bool? isPassword;
  final bool? isShowPassEye;
  final TitleFieldType fieldType; // New parameter for field type
  final String? Function(String?)? validate;
  final Function(String?)? onGenderChanged; // New callback for gender change

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontWeight: DesignConstant().kRegular,
          textSize: DesignConstant.kHeadline3FontSize,
        ),
        const SizedBox(
          height: 4,
        ),
        if (fieldType == TitleFieldType.date)
          GestureDetector(
            onTap: () => _showDatePicker(context),
            child: AbsorbPointer(
              child: CustomTextFormField(
                controller: controller,
                focusNode: focusNode,
                placeHolder: placeHolder,
                inputFormatter: inputFormatter ?? [],
                validate: validate,
                isPassword: isPassword ?? false,
                isShowPassEye: isShowPassEye ?? false,
                suffixIcon: IconButton(
                  icon: SvgPicture.asset("calendar".toSvgIcon),
                  onPressed: () => _showDatePicker(context),
                ),
              ),
            ),
          )
        else if (fieldType == TitleFieldType.gender)
          GestureDetector(
            onTap: () => _showGenderPicker(context),
            child: AbsorbPointer(
              child: CustomTextFormField(
                controller: controller,
                focusNode: focusNode,
                placeHolder: placeHolder,
                inputFormatter: inputFormatter ?? [],
                validate: validate,
                isPassword: isPassword ?? false,
                isShowPassEye: isShowPassEye ?? false,
                suffixIcon: IconButton(
                  icon: SvgPicture.asset("chevron-down".toSvgIcon),
                  onPressed: () => _showDatePicker(context),
                ),
              ),
            ),
          )
        else
          CustomTextFormField(
            controller: controller,
            focusNode: focusNode,
            placeHolder: placeHolder,
            inputFormatter: inputFormatter ?? [],
            validate: validate,
            isPassword: isPassword ?? false,
            isShowPassEye: isShowPassEye ?? false,
          ),
      ],
    );
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDate) {
                  String formattedDate = DateFormat('dd/MM/yyy').format(newDate);
                  controller.text = formattedDate;
                },
                use24hFormat: true,
                mode: CupertinoDatePickerMode.date,
              ),
            ),
            CupertinoButton(
              child: const Text('Done'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }

  void _showGenderPicker(BuildContext context) {
    final List<String> genderOptions = ['Male', 'Female'];
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: CupertinoPicker(
                itemExtent: 32.0,
                onSelectedItemChanged: (int index) {
                  controller.text = genderOptions[index];
                  if (onGenderChanged != null) {
                    onGenderChanged!(genderOptions[index]);
                  }
                },
                children: genderOptions.map((String value) {
                  return Center(child: Text(value));
                }).toList(),
              ),
            ),
            CupertinoButton(
              child: const Text('Done'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }
}
