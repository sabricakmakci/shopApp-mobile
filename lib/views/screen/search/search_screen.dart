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

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends BaseState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isShowBackArrow: false,
      isShowAppbar: true,
      titleWidget: CustomText(
        text: AppLocalizations.of(context)!.search,
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
              title: AppLocalizations.of(context)!.noResultFound,
              desc: AppLocalizations.of(context)!.noResultFoundDesc,
              image: "big-search",
            ),
          ],
        ),
      ),
    );
  }
}
