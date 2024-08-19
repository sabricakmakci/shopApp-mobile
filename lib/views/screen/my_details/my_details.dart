import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/components/buttons/custom_button.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shop_app_mobile/views/components/title_field_component.dart';

class MyDetailsScreen extends StatefulWidget {
  const MyDetailsScreen({super.key});

  @override
  State<MyDetailsScreen> createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends BaseState<MyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      isShowBackArrow: true,
      titleWidget: CustomText(
        text: AppLocalizations.of(context)!.myDetails,
        fontWeight: DesignConstant().kSemiBold,
        textSize: DesignConstant.kHeadline1FontSize,
        textColor: ColorConstant.kPrimary900Color,
        isTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomButton(
          type: CustomButtonType.primary,
          expandTitle: false,
          buttonTitle: AppLocalizations.of(context)!.saveChanges,
          onPress: () {
            Get.back();
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleFieldComponent(
              controller: myDetailsController.detailNameSurnameController,
              focusNode: myDetailsController.detailNameSurnameFocusNode,
              title: AppLocalizations.of(context)!.fullName,
              placeHolder: AppLocalizations.of(context)!.enterFullName,
              isPassword: false,
            ),
            const SizedBox(
              height: 16,
            ),
            TitleFieldComponent(
              controller: myDetailsController.detailEmailController,
              focusNode: myDetailsController.detailEmailFocusNode,
              title: AppLocalizations.of(context)!.email,
              placeHolder: AppLocalizations.of(context)!.enterEmail,
              isPassword: false,
            ),
            const SizedBox(
              height: 16,
            ),
            TitleFieldComponent(
              controller: myDetailsController.detailBirthdayController,
              focusNode: myDetailsController.detailBirthdayFocusNode,
              title: AppLocalizations.of(context)!.birthday,
              placeHolder: AppLocalizations.of(context)!.selectBirtday,
              isPassword: false,
              fieldType: TitleFieldType.date, // Specify field type as date
            ),
            const SizedBox(
              height: 16,
            ),
            TitleFieldComponent(
              controller: myDetailsController.detailGenderController,
              focusNode: myDetailsController.detailGenderFocusNode,
              title: AppLocalizations.of(context)!.gender,
              placeHolder: AppLocalizations.of(context)!.selectGender,
              isPassword: false,
              fieldType: TitleFieldType.gender, // Specify field type as gender
            ),
            const SizedBox(
              height: 16,
            ),
            TitleFieldComponent(
              controller: myDetailsController.detailPhoneController,
              focusNode: myDetailsController.detailPhoneFocusNode,
              title: AppLocalizations.of(context)!.phoneNumber,
              placeHolder: AppLocalizations.of(context)!.enterPhoneNumber,
              inputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              isPassword: false,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.phoneNumberRequired;
                }
                // You can add more validation logic here if needed
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
