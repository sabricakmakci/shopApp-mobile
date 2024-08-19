import 'package:flutter/material.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/components/buttons/custom_button.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shop_app_mobile/core/utils/route/route.dart';
import 'package:shop_app_mobile/views/components/title_field_component.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends BaseState<ForgotPasswordScreen> {
  @override
  void dispose() {
    forgotPasswordController.forgotPasswordEmailController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      isShowBackArrow: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomButton(
          buttonTitle: "Send Code",
          onPress: () {
            StaticRoute.goVerificationCodeScreen();
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Forgot password",
              fontWeight: DesignConstant().kSemiBold,
              textSize: DesignConstant.kHeadline0FontSize,
              isTitle: true,
            ),
            const SizedBox(
              height: 4,
            ),
            CustomText(
              text: "Enter your email for the verification process. We will send 4 digits code to your email.",
              maxLine: 2,
              fontWeight: DesignConstant().kLight,
              textSize: DesignConstant.kHeadline3FontSize,
              textColor: ColorConstant.kPrimary500Color,
            ),
            const SizedBox(
              height: 24,
            ),
            TitleFieldComponent(
              controller: forgotPasswordController.forgotPasswordEmailController,
              focusNode: forgotPasswordController.forgorPasswordEmailNode,
              title: AppLocalizations.of(context)!.email,
              placeHolder: AppLocalizations.of(context)!.enterEmail,
              isPassword: false,
            ),
          ],
        ),
      ),
    );
  }
}
