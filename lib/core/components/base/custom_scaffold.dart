import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';

import '../../../views/screen/no_connection/no_connection_screen.dart';
import '../../../views/screen/no_internet/no_internet_screen.dart';
import 'base_state.dart';

class CustomScaffold extends StatefulWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? appBarColor;
  final Color? appBarTextandIconColor;
  final bool isShowAppbar;
  final bool isShowBackArrow;
  final bool isCenterTitle;
  final bool isSafeArea;
  final bool removeSpaceHeader;
  final bool removeDividerHeader;
  final bool safeAreaTop;
  final bool safeArearBottom;
  final bool resizeToAvoidBottomInset;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final String? title;
  final Widget? titleWidget;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? toolBarWidget;
  final Widget? backButtonWidget;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Function()? onToolBarPressed;
  final IconData icon;
  final Function()? onBackPressed;
  final List<Widget>? persistentFooterButtons;
  const CustomScaffold({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.appBarColor,
    this.appBarTextandIconColor,
    this.isShowAppbar = true,
    this.isShowBackArrow = true,
    this.isCenterTitle = false,
    this.isSafeArea = true,
    this.removeSpaceHeader = true,
    this.removeDividerHeader = true,
    this.safeAreaTop = true,
    this.safeArearBottom = true,
    this.resizeToAvoidBottomInset = true,
    this.floatingActionButtonAnimator,
    this.title,
    this.titleWidget,
    this.floatingActionButton,
    this.toolBarWidget,
    this.backButtonWidget,
    this.floatingActionButtonLocation,
    this.onToolBarPressed,
    this.icon = Icons.chevron_left_rounded,
    this.onBackPressed,
    this.persistentFooterButtons,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends BaseState<CustomScaffold> {
  @override
  Widget build(BuildContext context) => Obx(() {
        return connectivityController.isOnline.value
            ? !connectivityController.isFailServer.value
                ? GestureDetector(
                    child: Scaffold(
                        bottomNavigationBar: widget.bottomNavigationBar,
                        floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
                        floatingActionButtonLocation: widget.floatingActionButtonLocation,
                        floatingActionButton: widget.floatingActionButton,
                        backgroundColor: widget.backgroundColor ?? ColorConstant.kWhiteColor,
                        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
                        persistentFooterButtons: widget.persistentFooterButtons,
                        appBar: widget.isShowAppbar
                            ? CupertinoNavigationBar(
                                border: Border(
                                    bottom: BorderSide(
                                        color: widget.removeDividerHeader
                                            ? ColorConstant.kTransparent
                                            : ColorConstant.kGrayColor)),
                                backgroundColor: widget.appBarColor ?? ColorConstant.kWhiteColor,
                                trailing: GestureDetector(
                                  onTap: widget.onToolBarPressed ?? () {},
                                  child: widget.toolBarWidget ??
                                      const SizedBox(
                                        width: 50,
                                      ),
                                ),
                                leading: widget.isShowBackArrow
                                    ? GestureDetector(
                                        onTap: widget.onBackPressed ??
                                            () {
                                              Get.back();
                                            },
                                        child: Container(
                                          constraints: const BoxConstraints(maxWidth: 25, maxHeight: 25),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: widget.backButtonWidget ??
                                                Icon(
                                                  widget.icon,
                                                  color:
                                                      widget.appBarTextandIconColor ?? ColorConstant.kPrimary900Color,
                                                ),
                                          ),
                                        ),
                                      )
                                    : null,
                                automaticallyImplyLeading: widget.isShowBackArrow,
                                middle: widget.titleWidget ??
                                    Align(
                                      alignment: widget.isCenterTitle ? Alignment.center : Alignment.centerLeft,
                                      child: widget.title != null
                                          ? FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: CustomText(
                                                text: widget.title ?? "",
                                                textSize: DesignConstant.kHeadline2FontSize,
                                                textAlign: widget.isCenterTitle ? TextAlign.center : TextAlign.start,
                                                fontWeight: DesignConstant().kBold,
                                                textColor:
                                                    widget.appBarTextandIconColor ?? ColorConstant.kPrimary900Color,
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    ),
                              )
                            : null,
                        body: widget.isSafeArea
                            ? SafeArea(top: widget.safeAreaTop, bottom: widget.safeArearBottom, child: widget.child)
                            : widget.child),
                  )
                : const NoConnectionScreen()
            : const Scaffold(body: NoInternetScreen());
      });
}
