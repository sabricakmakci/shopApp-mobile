import 'package:flutter/material.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/components/buttons/custom_button.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shop_app_mobile/core/utils/route/route.dart';
import 'package:shop_app_mobile/views/components/divider_with_text.dart';
import 'package:shop_app_mobile/views/components/title_field_component.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      isShowBackArrow: false,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppLocalizations.of(context)!.loginAccountTitle,
              fontWeight: DesignConstant().kSemiBold,
              textSize: DesignConstant.kHeadline0FontSize,
              maxLine: 2,
              isTitle: true,
            ),
            const SizedBox(
              height: 4,
            ),
            CustomText(
              text: AppLocalizations.of(context)!.loginAccountDesc,
              fontWeight: DesignConstant().kLight,
              textSize: DesignConstant.kHeadline3FontSize,
              textColor: ColorConstant.kPrimary500Color,
            ),
            const SizedBox(
              height: 24,
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
            Row(
              children: [
                CustomText(
                  text: AppLocalizations.of(context)!.forgotYourPassword,
                ),
                GestureDetector(
                  onTap: () {
                    StaticRoute.goForgotPasswordScreen();
                  },
                  child: CustomText(
                    text: AppLocalizations.of(context)!.reserPassword,
                    textDecoration: TextDecoration.underline,
                    fontWeight: DesignConstant().kSemiBold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              type: CustomButtonType.primary,
              expandTitle: false,
              buttonTitle: AppLocalizations.of(context)!.logIn,
              onPress: () {
                loginController.login();
              },
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
              onPress: () {
                StaticRoute.goBottomBar();
              },
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
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: AppLocalizations.of(context)!.dontHaveAccount,
                  textColor: ColorConstant.kPrimary500Color,
                ),
                InkWell(
                  onTap: () {
                    StaticRoute.goRegisterScreen();
                  },
                  child: CustomText(
                    text: AppLocalizations.of(context)!.join,
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
