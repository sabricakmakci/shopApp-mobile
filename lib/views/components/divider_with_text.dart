import 'package:flutter/material.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: ColorConstant.kPrimary100Color,
              thickness: 1,
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomText(
                text: text,
                textColor: ColorConstant.kPrimary500Color,
              )),
          const Expanded(
            child: Divider(
              color: ColorConstant.kPrimary100Color,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
