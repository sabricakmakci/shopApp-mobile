import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/components/buttons/custom_button.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/extension/string/image_path_extension.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shop_app_mobile/core/utils/route/route.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends BaseState<PaymentMethodsScreen> {
  @override
  void initState() {
    paymentMethodsController.getCreditCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      isShowBackArrow: true,
      titleWidget: CustomText(
        text: AppLocalizations.of(context)!.paymentMethods,
        fontWeight: DesignConstant().kSemiBold,
        textSize: DesignConstant.kHeadline1FontSize,
        textColor: ColorConstant.kPrimary900Color,
        isTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomButton(
          type: CustomButtonType.primary,
          expandTitle: false,
          buttonTitle: AppLocalizations.of(context)!.apply,
          onPress: () {},
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            const SizedBox(height: 16),
            CustomText(
              text: AppLocalizations.of(context)!.savedCards,
              fontWeight: DesignConstant().kSemiBold,
              textSize: DesignConstant.kHeadline3FontSize,
              textColor: ColorConstant.kPrimary900Color,
              isTitle: true,
            ),
            const SizedBox(height: 8),
            CustomButton(
              type: CustomButtonType.secondary,
              expandTitle: false,
              buttonTitle: AppLocalizations.of(context)!.addNewCard,
              leftIcon: "plus".toSvgIcon,
              onPress: () {
                StaticRoute.goAddNewCardScreen();
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: paymentMethodsController.creditCards.length,
                  itemBuilder: (BuildContext context, int index) {
                    final card = paymentMethodsController.creditCards[index];
                    var isDefault = card.isDefault;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorConstant.kPrimary100Color,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 8),
                              SvgPicture.asset(card.image.toSvgIcon),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: card.number,
                                      fontWeight: DesignConstant().kSemiBold,
                                      textSize: DesignConstant.kBody0FontSize,
                                    ),
                                  ],
                                ),
                              ),
                              isDefault
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: ColorConstant.kPrimary100Color,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomText(
                                          text: "Default",
                                          fontWeight: DesignConstant().kRegular,
                                          textSize: DesignConstant.kBody3FontSize,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              Obx(() {
                                return Radio<String>(
                                  activeColor: ColorConstant.kPrimary900Color,
                                  value: card.number,
                                  groupValue: paymentMethodsController.selectedCreditCardNumber.value,
                                  onChanged: (value) {
                                    if (value != null) {
                                      paymentMethodsController.setSelectedCard(value);
                                    }
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
