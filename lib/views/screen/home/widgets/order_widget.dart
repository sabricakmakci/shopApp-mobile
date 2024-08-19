import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';

import '../../../../core/utils/constants/design_constant.dart';
import '../../../../model/response/completed_order.dart';

class OrderWidget extends StatelessWidget {
  final CompletedOrder order;

  const OrderWidget({required this.order, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: 0).format(order.price);
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                order.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 4),
          CustomText(
            text: order.name,
            fontWeight: DesignConstant().kSemiBold,
            textSize: DesignConstant.kBody1FontSize,
          ),
          const SizedBox(height: 4),
          CustomText(
            text: formattedPrice,
            fontWeight: DesignConstant().kLight,
            textSize: DesignConstant.kBody2FontSize,
            textColor: ColorConstant.kPrimary500Color,
          ),
        ],
      ),
    );
  }
}
