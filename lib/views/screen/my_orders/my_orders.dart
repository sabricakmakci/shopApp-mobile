import 'package:flutter/material.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';
import 'package:shop_app_mobile/views/screen/my_orders/widgets/comleted_list.dart';
import 'package:shop_app_mobile/views/screen/my_orders/widgets/ongoing_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends BaseState<MyOrdersScreen> {
  @override
  void initState() {
    myOrdersController.getCompletedOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScaffold(
        isShowBackArrow: true,
        isShowAppbar: true,
        titleWidget: CustomText(
          text: AppLocalizations.of(context)!.myOrders,
          fontWeight: DesignConstant().kSemiBold,
          textSize: DesignConstant.kHeadline1FontSize,
          textColor: ColorConstant.kPrimary900Color,
          isTitle: true,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 52,
                decoration: BoxDecoration(
                  color: ColorConstant.kPrimary100Color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  dividerHeight: 0.0,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: -30, vertical: 8),
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  labelColor: ColorConstant.kPrimary900Color,
                  unselectedLabelColor: ColorConstant.kPrimary400Color,
                  tabs: [
                    Tab(
                      text: AppLocalizations.of(context)!.ongoing,
                    ),
                    Tab(
                      text: AppLocalizations.of(context)!.completed,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Expanded(
                child: TabBarView(
                  children: [
                    OngoingList(),
                    CompletedList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
