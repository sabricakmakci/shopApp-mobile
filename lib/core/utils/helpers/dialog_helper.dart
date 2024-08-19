import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop_app_mobile/core/components/buttons/custom_button.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/extension/string/image_path_extension.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum DialogType {
  info,
  success,
  error,
}

class ShowDialog {
  static Future<void> showCustomDialog({
    required String title,
    Function()? onConfirm,
    Function()? onCancel,
    Function()? onClose,
    BuildContext? context,
    bool? confirmButton = true,
    String? icon,
    Color? iconColor,
    Key? key,
    String? desc,
    Widget? desWidget,
    bool isCancelable = true,
    Color? titleColor,
    String? confirmText,
    bool? closeButton = false,
    double? confirmButtonWidth,
    String? noText,
    bool showCancel = true,
    Widget? iconWidget,
    Widget? picwidget,
    DialogType? type, // Yeni parametre eklendi
  }) async {
    final noText0 = noText ?? AppLocalizations.of(context!)!.cancel;
    final confirmText0 = confirmText ?? AppLocalizations.of(context!)!.ok;

    // Icon ve renkleri type'a göre ayarla
    late String iconPath;
    late Color typeColor;
    switch (type) {
      case DialogType.success:
        iconPath = "success".toSvgIcon;
        typeColor = ColorConstant.kPrimary900Color;
        break;
      case DialogType.error:
        iconPath = "warning".toSvgIcon;
        typeColor = ColorConstant.kErrorColor;
        break;
      case DialogType.info:
      default:
        iconPath = "info".toSvgIcon;
        typeColor = ColorConstant.kPrimary900Color;
        break;
    }

    return Get.dialog(
      // ignore: deprecated_member_use
      WillPopScope(
        onWillPop: () {
          if (isCancelable) {
            if (onClose != null) {
              onClose.call();
            } else {
              Get.back();
            }
          }
          return Future.value(false);
        },
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorConstant.kWhiteColor,
              borderRadius: BorderRadius.circular(DesignConstant.kRadius10),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (iconWidget != null) iconWidget,
                    if (icon != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SvgPicture.asset(
                          icon.toSvgIcon,
                          height: 70,
                          colorFilter: ColorFilter.mode(
                            iconColor ?? ColorConstant.kPrimary800Color,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    if (icon == null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SvgPicture.asset(
                          iconPath,
                          height: 70,
                        ),
                      ),
                    CustomText(
                      text: title,
                      textColor: titleColor ?? ColorConstant.kPrimary900Color,
                      fontWeight: DesignConstant().kSemiBold,
                      textAlign: TextAlign.center,
                      isTitle: true,
                      textSize: DesignConstant.kHeadline4FontSize,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (picwidget != null) picwidget,
                    if (picwidget != null)
                      const SizedBox(
                        height: 10,
                      ),
                    if (desWidget != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: desWidget,
                      ),
                    if (desWidget == null && desc != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: CustomText(
                          text: desc,
                          textColor: ColorConstant.kPrimary400Color,
                          fontWeight: DesignConstant().kLight,
                          textAlign: TextAlign.center,
                          textSize: DesignConstant.kBody0FontSize,
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        showCancel
                            ? Expanded(
                                child: CustomButton(
                                  buttonTitle: noText0.capitalize,
                                  radius: DesignConstant.kRadius10,
                                  textColor: ColorConstant.kPrimary900Color,
                                  color: ColorConstant.kWhiteColor,
                                  borderColor: ColorConstant.kPrimary900Color,
                                  onPress: onCancel ??
                                      () {
                                        Get.back();
                                      },
                                ),
                              )
                            : const SizedBox.shrink(),
                        SizedBox(
                          width: showCancel ? 10 : 0,
                        ),
                        if (confirmButton!)
                          confirmButtonWidth == null
                              ? Expanded(
                                  child: CustomButton(
                                    buttonTitle: confirmText0.capitalize,
                                    radius: DesignConstant.kRadius10,
                                    textColor: ColorConstant.kWhiteColor,
                                    color: typeColor,
                                    onPress: onConfirm ??
                                        () {
                                          Get.back();
                                        },
                                  ),
                                )
                              : Center(
                                  child: CustomButton(
                                    buttonTitle: confirmText0.capitalize,
                                    width: confirmButtonWidth,
                                    radius: DesignConstant.kRadius10,
                                    textColor: ColorConstant.kWhiteColor,
                                    color: typeColor,
                                    onPress: onConfirm ??
                                        () {
                                          Get.back();
                                        },
                                  ),
                                )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
