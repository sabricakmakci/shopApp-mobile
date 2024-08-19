import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/components/bottom_bar/bottom_navigation_item.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends BaseState<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isShowBackArrow: false,
      isShowAppbar: false,
      bottomNavigationBar: Obx(
        () => CustomBottomBar(
          height: 60,
          iconSize: 24,
          backgroundColor: ColorConstant.kWhiteColor,
          selectedColor: ColorConstant.kPrimary900Color,
          selectedIndex: bottomBarMenuController.selectedIndex.value,
          selectMenuItem: (item) {
            bottomBarMenuController.onItemTapped(bottomBarMenuController.items.indexOf(item));
          },
          items: bottomBarMenuController.items,
        ),
      ),
      child: Obx(() => bottomBarMenuController.pages[bottomBarMenuController.selectedIndex.value]),
    );
  }
}
