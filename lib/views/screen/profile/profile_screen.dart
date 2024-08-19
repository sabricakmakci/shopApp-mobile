import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';
import 'package:shop_app_mobile/views/screen/profile/widgets/profile_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/utils/constants/color_constant.dart';
import '../../../core/utils/helpers/dialog_helper.dart';
import '../../../core/utils/route/route.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isShowBackArrow: false,
      isShowAppbar: true,
      titleWidget: CustomText(
        text: AppLocalizations.of(context)!.account,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Divider(),
          ),
          ProfileTile(
            title: AppLocalizations.of(context)!.myOrders,
            icon: "orders",
            onTap: () {
              StaticRoute.goMyOrdersScreen();
            },
          ),
          Container(
            color: ColorConstant.kPrimary100Color,
            height: 8,
          ),
          ProfileTile(
            title: AppLocalizations.of(context)!.myDetails,
            icon: "my-details",
            onTap: () {
              StaticRoute.goMyDetailsScreen();
            },
          ),
          const Divider(
            indent: 50,
          ),
          ProfileTile(
            title: AppLocalizations.of(context)!.changeLanguage,
            icon: "edit",
            onTap: () {
              StaticRoute.goChangeLanguageScreen();
            },
          ),
          const Divider(
            indent: 50,
          ),
          ProfileTile(
            title: AppLocalizations.of(context)!.addressBook,
            icon: "adress",
            onTap: () {
              StaticRoute.goMyAddressScreen();
            },
          ),
          const Divider(
            indent: 50,
          ),
          ProfileTile(
            title: AppLocalizations.of(context)!.paymentMethods,
            icon: "payment",
            onTap: () {
              StaticRoute.goPaymentMethodsScreen();
            },
          ),
          const Divider(
            indent: 50,
          ),
          ProfileTile(
            title: AppLocalizations.of(context)!.notifications,
            icon: "bell",
            onTap: () {},
          ),
          Container(
            color: ColorConstant.kPrimary100Color,
            height: 8,
          ),
          ProfileTile(
            title: AppLocalizations.of(context)!.faqs,
            icon: "question",
            onTap: () {},
          ),
          const Divider(
            indent: 50,
          ),
          ProfileTile(
            title: AppLocalizations.of(context)!.helpCenter,
            icon: "help",
            onTap: () {},
          ),
          Container(
            color: ColorConstant.kPrimary100Color,
            height: 8,
          ),
          ProfileTile(
            title: AppLocalizations.of(context)!.logout,
            textColor: ColorConstant.kErrorColor,
            icon: "logout",
            isShowRightIcon: false,
            onTap: () {
              ShowDialog.showCustomDialog(
                context: context,
                type: DialogType.error,
                title: AppLocalizations.of(context)!.logout,
                desc: AppLocalizations.of(context)!.logutPopupDesc,
                confirmText: AppLocalizations.of(context)!.logutPopupConfirm,
                onConfirm: () {
                  profileController.logout();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
