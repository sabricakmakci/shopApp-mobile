import 'package:flutter/material.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/components/buttons/custom_button.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shop_app_mobile/views/components/title_field_component.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends BaseState<ResetPasswordScreen> {
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
          onPress: () {},
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Reset Password",
              fontWeight: DesignConstant().kSemiBold,
              textSize: DesignConstant.kHeadline0FontSize,
              isTitle: true,
            ),
            const SizedBox(
              height: 4,
            ),
            CustomText(
              text: "Set the new password for your account so you can login and access all the features.",
              maxLine: 2,
              fontWeight: DesignConstant().kLight,
              textSize: DesignConstant.kHeadline3FontSize,
              textColor: ColorConstant.kPrimary500Color,
            ),
            const SizedBox(
              height: 24,
            ),
            TitleFieldComponent(
              controller: forgotPasswordController.resetPasswordController,
              focusNode: forgotPasswordController.resetPasswordNode,
              title: AppLocalizations.of(context)!.password,
              placeHolder: AppLocalizations.of(context)!.enterPassword,
              isPassword: true,
              isShowPassEye: true,
            ),
            const SizedBox(
              height: 16,
            ),
            TitleFieldComponent(
              controller: forgotPasswordController.resetPasswordConfirmController,
              focusNode: forgotPasswordController.resetPasswordConfirmNode,
              title: AppLocalizations.of(context)!.password,
              placeHolder: AppLocalizations.of(context)!.enterPassword,
              isPassword: true,
              isShowPassEye: true,
            ),
          ],
        ),
      ),
    );
  }
}
