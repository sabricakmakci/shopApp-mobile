import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/extension/string/image_path_extension.dart';

import '../utils/constants/color_constant.dart';
import '../utils/constants/design_constant.dart';

class ImageTitleDescWidget extends StatelessWidget {
  final String title;
  final String desc;
  final String image;
  const ImageTitleDescWidget({
    super.key,
    required this.title,
    required this.desc,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(image.toSvgIcon),
        const SizedBox(
          height: 24,
        ),
        CustomText(
          text: title,
          textAlign: TextAlign.center,
          fontWeight: DesignConstant().kSemiBold,
          textSize: DesignConstant.kHeadline4FontSize,
          maxLine: 2,
          textColor: ColorConstant.kPrimary900Color,
          isTitle: true,
        ),
        const SizedBox(
          height: 12,
        ),
        CustomText(
          text: desc,
          textAlign: TextAlign.center,
          fontWeight: DesignConstant().kLight,
          textSize: DesignConstant.kHeadline3FontSize,
          maxLine: 2,
          textColor: ColorConstant.kPrimary500Color,
        ),
      ],
    );
  }
}
