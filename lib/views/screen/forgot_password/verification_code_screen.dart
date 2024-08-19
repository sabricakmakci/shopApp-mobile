import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/components/buttons/custom_button.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shop_app_mobile/core/utils/route/route.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends BaseState<VerificationCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      isShowBackArrow: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomButton(
          buttonTitle: "Continue",
          onPress: () {
            StaticRoute.goResetPasswordScreen();
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Enter 4 Digit Code",
              fontWeight: DesignConstant().kSemiBold,
              textSize: DesignConstant.kHeadline0FontSize,
              isTitle: true,
            ),
            const SizedBox(
              height: 4,
            ),
            CustomText(
              text:
                  "Enter 4 digit code that your receive on your email.(${forgotPasswordController.forgotPasswordEmailController.text})",
              maxLine: 2,
              fontWeight: DesignConstant().kLight,
              textSize: DesignConstant.kHeadline3FontSize,
              textColor: ColorConstant.kPrimary500Color,
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    cursorColor: ColorConstant.kBlackColor,
                    animationType: AnimationType.none,
                    backgroundColor: ColorConstant.kTransparent,
                    pinTheme: PinTheme(
                      selectedColor: ColorConstant.kBlueColor,
                      activeColor: ColorConstant.kBlackColor,
                      inactiveColor: ColorConstant.kDisabledColor,
                      fieldWidth: 68,
                      fieldHeight: 69,
                      shape: PinCodeFieldShape.box,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(DesignConstant.kRadius10),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: AppLocalizations.of(context)!.forgotYourPassword,
                ),
                GestureDetector(
                  onTap: () {},
                  child: CustomText(
                    text: AppLocalizations.of(context)!.reserPassword,
                    textDecoration: TextDecoration.underline,
                    fontWeight: DesignConstant().kSemiBold,
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
