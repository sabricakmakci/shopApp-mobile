import 'package:flutter/material.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/ui/image_title_desc_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends BaseState<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isShowBackArrow: true,
      isShowAppbar: true,
      titleWidget: CustomText(
        text: AppLocalizations.of(context)!.notifications,
        fontWeight: DesignConstant().kSemiBold,
        textSize: DesignConstant.kHeadline1FontSize,
        textColor: ColorConstant.kPrimary900Color,
        isTitle: true,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageTitleDescWidget(
              title: AppLocalizations.of(context)!.haventAnyNotofocation,
              desc: AppLocalizations.of(context)!.haventAnyNotofocationDesc,
              image: "big-bell",
            ),
          ],
        ),
      ),
    );
  }
}
