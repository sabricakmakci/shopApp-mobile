import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/ui/image_title_desc_widget.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/model/response/completed_order.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/utils/constants/design_constant.dart';

class CompletedList extends StatefulWidget {
  const CompletedList({super.key});

  @override
  State<CompletedList> createState() => _CompletedListState();
}

class _CompletedListState extends BaseState<CompletedList> {
  @override
  void initState() {
    super.initState();
    myOrdersController.getCompletedOrders();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorConstant.kPrimary900Color,
      onRefresh: () => myOrdersController.getCompletedOrders(),
      child: Obx(() {
        if (myOrdersController.completedOrders.isEmpty) {
          return emptyCompletedOrderList();
        }
        return buildCompletedOrderList(myOrdersController.completedOrders);
      }),
    );
  }

  Widget buildCompletedOrderList(List<CompletedOrder> orders) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (BuildContext context, int index) {
        final order = orders[index];
        final formattedPrice =
            NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: 0).format(order.price);
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorConstant.kPrimary100Color,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      order.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: order.name,
                          fontWeight: DesignConstant().kSemiBold,
                          textSize: DesignConstant.kBody1FontSize,
                        ),
                        const SizedBox(height: 4),
                        CustomText(
                          text: "${AppLocalizations.of(context)!.size} ${order.size}",
                          fontWeight: DesignConstant().kLight,
                          textSize: DesignConstant.kBody2FontSize,
                          textColor: ColorConstant.kPrimary500Color,
                        ),
                        const Spacer(),
                        CustomText(
                          text: formattedPrice,
                          fontWeight: DesignConstant().kSemiBold,
                          textSize: DesignConstant.kBody1FontSize,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorConstant.kSuccessColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        text: order.status,
                        fontWeight: DesignConstant().kRegular,
                        textSize: DesignConstant.kBody3FontSize,
                        textColor: ColorConstant.kSuccessColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget emptyCompletedOrderList() {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageTitleDescWidget(
            title: AppLocalizations.of(context)!.noCompletedOrder,
            desc: AppLocalizations.of(context)!.noCompletedOrderDesc,
            image: "box",
          ),
        ],
      ),
    );
  }
}
