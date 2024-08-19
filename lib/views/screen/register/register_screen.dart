import 'package:flutter/material.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/components/buttons/custom_button.dart';
import 'package:shop_app_mobile/core/components/buttons/custom_loading_button.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shop_app_mobile/core/utils/route/route.dart';
import 'package:shop_app_mobile/views/components/divider_with_text.dart';
import 'package:shop_app_mobile/views/components/title_field_component.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseState<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      isShowBackArrow: true,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppLocalizations.of(context)!.createAccountTitle,
              fontWeight: DesignConstant().kSemiBold,
              textSize: DesignConstant.kHeadline0FontSize,
              isTitle: true,
            ),
            CustomText(
              text: AppLocalizations.of(context)!.createAccountDesc,
              fontWeight: DesignConstant().kLight,
              textSize: DesignConstant.kHeadline2FontSize,
              textColor: ColorConstant.kPrimary500Color,
            ),
            const SizedBox(
              height: 24,
            ),
            TitleFieldComponent(
              controller: registerController.fullNameController,
              focusNode: registerController.fullNameNode,
              title: AppLocalizations.of(context)!.fullName,
              placeHolder: AppLocalizations.of(context)!.enterFullName,
              isPassword: false,
            ),
            const SizedBox(
              height: 16,
            ),
            TitleFieldComponent(
              controller: registerController.emailController,
              focusNode: registerController.emailNode,
              title: AppLocalizations.of(context)!.email,
              placeHolder: AppLocalizations.of(context)!.enterEmail,
              isPassword: false,
            ),
            const SizedBox(
              height: 16,
            ),
            TitleFieldComponent(
              controller: registerController.passwordController,
              focusNode: registerController.passwordNode,
              title: AppLocalizations.of(context)!.password,
              placeHolder: AppLocalizations.of(context)!.enterPassword,
              isPassword: true,
              isShowPassEye: true,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomText(
              text: AppLocalizations.of(context)!.aggreementWarning,
              maxLine: 2,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomLoadingButton(
              controller: registerController.signUpController,
              onPressed: () async {},
              child: CustomText(
                text: AppLocalizations.of(context)!.createAccount,
                textColor: ColorConstant.kWhiteColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            DividerWithText(text: AppLocalizations.of(context)!.or),
            const SizedBox(
              height: 24,
            ),
            CustomButton(
              type: CustomButtonType.secondary,
              expandTitle: false,
              buttonTitle: AppLocalizations.of(context)!.signUpWithGoogle,
              leftIcon: "assets/icons/google-icon.svg",
              onPress: () {},
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              color: ColorConstant.kBlueColor,
              buttonTitle: AppLocalizations.of(context)!.signUpWithFacebook,
              leftIcon: "assets/icons/facebook-icon.svg",
              expandTitle: false,
              onPress: () {},
            ),
            const SizedBox(
              height: 16,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: AppLocalizations.of(context)!.alreadyHaveAccount),
                InkWell(
                  onTap: () {
                    StaticRoute.goLoginScreen();
                  },
                  child: CustomText(
                    text: AppLocalizations.of(context)!.logIn,
                    textDecoration: TextDecoration.underline,
                    fontWeight: DesignConstant().kSemiBold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
