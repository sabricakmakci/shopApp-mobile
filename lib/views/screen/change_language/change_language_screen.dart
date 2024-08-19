import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/components/buttons/custom_button.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../l10n/l10n.dart'; // L10n dosyasını import etmeyi unutmayın

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends BaseState<ChangeLanguageScreen> {
  @override
  void initState() {
    languageController.selectedLanguage.value = Get.locale?.languageCode ?? "en";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      isShowBackArrow: true,
      titleWidget: CustomText(
        text: AppLocalizations.of(context)!.changeLanguage,
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
          buttonTitle: AppLocalizations.of(context)!.saveChanges,
          onPress: () {
            if (languageController.selectedLanguage.value.isNotEmpty) {
              Locale newLocale = Locale(languageController.selectedLanguage.value);
              Get.updateLocale(newLocale);
              Get.back();
            }
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: L10n.all.map((locale) {
            return Column(
              children: [
                _buildLanguageOption(
                  context,
                  L10n.getLanguageName(locale.languageCode),
                  locale.languageCode,
                ),
                const SizedBox(height: 12),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(BuildContext context, String language, String code) {
    return GestureDetector(
      onTap: () {
        languageController.selectedLanguage.value = code;
      },
      child: Obx(() {
        bool isSelected = languageController.selectedLanguage.value == code;
        return Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? ColorConstant.kPrimary900Color : ColorConstant.kPrimary200Color,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: language,
                fontWeight: DesignConstant().kRegular,
                textSize: DesignConstant.kHeadline3FontSize,
              ),
              Radio<String>(
                activeColor: ColorConstant.kPrimary900Color,
                value: code,
                groupValue: languageController.selectedLanguage.value,
                onChanged: (value) {
                  if (value != null) {
                    languageController.selectedLanguage.value = value;
                  }
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
