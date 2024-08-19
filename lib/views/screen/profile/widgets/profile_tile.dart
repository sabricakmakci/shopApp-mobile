import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/extension/string/image_path_extension.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String icon;
  final Color? textColor;
  final bool isShowRightIcon;
  final Function()? onTap;

  const ProfileTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.textColor,
    this.isShowRightIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        leading: SvgPicture.asset(icon.toSvgIcon),
        title: CustomText(
          textColor: textColor ?? ColorConstant.kPrimary900Color,
          text: title,
          fontWeight: DesignConstant().kLight,
          textSize: DesignConstant.kHeadline3FontSize,
        ),
        trailing: isShowRightIcon ? SvgPicture.asset("chevron-right".toSvgIcon) : const SizedBox.shrink(),
        onTap: onTap,
      ),
    );
  }
}
