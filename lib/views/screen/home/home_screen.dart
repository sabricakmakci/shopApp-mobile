import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/extension/string/image_path_extension.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';
import 'package:shop_app_mobile/core/utils/route/route.dart';
import 'package:shop_app_mobile/views/screen/home/widgets/order_widget.dart';
import 'package:shop_app_mobile/views/screen/home/widgets/search_bar_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
  @override
  void initState() {
    myOrdersController.getCompletedOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isShowBackArrow: false,
      isShowAppbar: false,
      child: Padding(
        padding: const EdgeInsets.all(24.0).copyWith(bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppLocalizations.of(context)!.discover,
                  fontWeight: DesignConstant().kSemiBold,
                  textSize: DesignConstant.kHeadline0FontSize,
                  isTitle: true,
                ),
                GestureDetector(
                  onTap: () {
                    StaticRoute.goNotificationScreen();
                  },
                  child: SvgPicture.asset("bell".toSvgIcon),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 275,
                  child: SearchBarWidget(
                    controller: homeController.searchInputController,
                    placeHolder: AppLocalizations.of(context)!.searchforClothes,
                    suffixIcon: SizedBox.fromSize(
                      size: const Size.square(16),
                      child: SvgPicture.asset(
                        "mic".toSvgIcon,
                        fit: BoxFit.scaleDown,
                        colorFilter: const ColorFilter.mode(ColorConstant.kPrimary300Color, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Buraya tıklama işlemleri eklenebilir
                  },
                  child: Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorConstant.kBlackColor,
                    ),
                    child: SvgPicture.asset(
                      "filter".toSvgIcon,
                      fit: BoxFit.scaleDown,
                      colorFilter: const ColorFilter.mode(ColorConstant.kWhiteColor, BlendMode.srcIn),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(() {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 16.0), // Alt ve üst padding
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: myOrdersController.completedOrders.length,
                        itemBuilder: (context, index) {
                          final order = myOrdersController.completedOrders[index];
                          return OrderWidget(order: order);
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
