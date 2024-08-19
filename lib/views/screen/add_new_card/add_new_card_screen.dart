import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/components/buttons/custom_button.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shop_app_mobile/core/utils/helpers/dialog_helper.dart';
import 'package:shop_app_mobile/views/components/title_field_component.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends BaseState<AddNewCardScreen> {
  @override
  void dispose() {
    addNewCardController.cardNumberController.clear();
    addNewCardController.expiryDateController.clear();
    addNewCardController.cvvController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: true,
      isShowBackArrow: true,
      titleWidget: CustomText(
        text: AppLocalizations.of(context)!.addNewCard,
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
          buttonTitle: AppLocalizations.of(context)!.addCard,
          onPress: () {
            ShowDialog.showCustomDialog(
              context: context,
              type: DialogType.success,
              title: AppLocalizations.of(context)!.congratulations,
              desc: AppLocalizations.of(context)!.addedCardSuccessfully,
              showCancel: false,
              confirmText: AppLocalizations.of(context)!.thanks,
              onConfirm: () {
                Get.back();
                Get.back();
              },
            );
          },
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
              text: AppLocalizations.of(context)!.addCreditOrDebitCard,
              fontWeight: DesignConstant().kSemiBold,
              textSize: DesignConstant.kHeadline3FontSize,
              textColor: ColorConstant.kPrimary900Color,
              isTitle: true,
            ),
            const SizedBox(height: 16),
            TitleFieldComponent(
              controller: addNewCardController.cardNumberController,
              focusNode: addNewCardController.cardNumberFocusNode,
              title: AppLocalizations.of(context)!.cardNumber,
              placeHolder: AppLocalizations.of(context)!.enterYourCardNumber,
              isPassword: false,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TitleFieldComponent(
                    controller: addNewCardController.expiryDateController,
                    focusNode: addNewCardController.expiryDateFocusNode,
                    title: AppLocalizations.of(context)!.expDate,
                    placeHolder: AppLocalizations.of(context)!.mmYY,
                    isPassword: false,
                  ),
                ),
                const SizedBox(width: 16), // Add some space between the fields
                Expanded(
                  child: TitleFieldComponent(
                    controller: addNewCardController.cvvController,
                    focusNode: addNewCardController.cvvFocusNode,
                    title: AppLocalizations.of(context)!.cvv,
                    placeHolder: AppLocalizations.of(context)!.cvv,
                    isPassword: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
