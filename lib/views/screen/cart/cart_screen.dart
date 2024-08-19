import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/extension/string/image_path_extension.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/ui/image_title_desc_widget.dart';
import '../../../core/utils/constants/color_constant.dart';
import '../../../core/utils/route/route.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends BaseState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isShowBackArrow: false,
      isShowAppbar: true,
      titleWidget: CustomText(
        text: AppLocalizations.of(context)!.myCart,
        fontWeight: DesignConstant().kSemiBold,
        textSize: DesignConstant.kHeadline1FontSize,
        textColor: ColorConstant.kPrimary900Color,
        isTitle: true,
      ),
      toolBarWidget: GestureDetector(
        onTap: () {
          StaticRoute.goNotificationScreen();
        },
        child: SvgPicture.asset("bell".toSvgIcon),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageTitleDescWidget(
              title: AppLocalizations.of(context)!.yourCartEmpty,
              desc: AppLocalizations.of(context)!.yourCartEmptyDesc,
              image: "big-chart",
            ),
          ],
        ),
      ),
    );
  }
}
