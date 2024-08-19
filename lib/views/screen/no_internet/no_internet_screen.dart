import 'package:flutter/material.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';

import '../../../core/components/base/base_state.dart';
import '../../../core/components/buttons/custom_button.dart';
import '../../../core/utils/helpers/device_utils.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends BaseState<NoInternetScreen> {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          children: [
            spaceHeight(400),
            CustomText(text: "No Internet"),
            Padding(
              padding: DesignConstant.kPagePadding16,
              child: CustomButton(
                onPress: () {
                  connectivityController.initConnectivity();
                },
                width: DeviceUtils.getScaledWidth(context, .9),
                child: CustomText(
                  text: 'Try Again',
                  textColor: ColorConstant.kWhiteColor,
                  fontWeight: DesignConstant().kSemiBold,
                ),
              ),
            )
          ],
        ),
      );
}
