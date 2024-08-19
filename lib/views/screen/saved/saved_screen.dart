import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/ui/image_title_desc_widget.dart';
import '../../../core/utils/constants/color_constant.dart';
import '../../../core/utils/route/route.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends BaseState<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isShowBackArrow: false,
      isShowAppbar: true,
      titleWidget: CustomText(
        text: AppLocalizations.of(context)!.saved,
        fontWeight: DesignConstant().kSemiBold,
        textSize: DesignConstant.kHeadline1FontSize,
        textColor: ColorConstant.kPrimary900Color,
        isTitle: true,
      ),
      toolBarWidget: GestureDetector(
        onTap: () {
          StaticRoute.goNotificationScreen();
        },
        child: SvgPicture.asset("assets/icons/bell.svg"),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageTitleDescWidget(
              title: AppLocalizations.of(context)!.noSavedItem,
              desc: AppLocalizations.of(context)!.noSavedItemDesc,
              image: "big-saved",
            ),
          ],
        ),
      ),
    );
  }
}
