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

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({super.key});

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends BaseState<MyAddressScreen> {
  @override
  void initState() {
    myAddressController.getAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      isShowBackArrow: true,
      titleWidget: CustomText(
        text: AppLocalizations.of(context)!.addressBook,
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
            const SizedBox(height: 24),
            CustomText(
              text: AppLocalizations.of(context)!.mySavedAddress,
              fontWeight: DesignConstant().kSemiBold,
              textSize: DesignConstant.kHeadline3FontSize,
              textColor: ColorConstant.kPrimary900Color,
              isTitle: true,
            ),
            const SizedBox(height: 8),
            CustomButton(
              type: CustomButtonType.secondary,
              expandTitle: false,
              buttonTitle: AppLocalizations.of(context)!.addNewAddress,
              leftIcon: "plus".toSvgIcon,
              onPress: () {},
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: myAddressController.addresses.length,
                  itemBuilder: (BuildContext context, int index) {
                    final address = myAddressController.addresses[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
                        height: 75,
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
                              SvgPicture.asset("location".toSvgIcon),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: address.title,
                                      fontWeight: DesignConstant().kSemiBold,
                                      textSize: DesignConstant.kBody0FontSize,
                                    ),
                                    const SizedBox(height: 4),
                                    CustomText(
                                      text: address.description,
                                      fontWeight: DesignConstant().kLight,
                                      textSize: DesignConstant.kBody1FontSize,
                                    ),
                                  ],
                                ),
                              ),
                              Obx(() {
                                return Radio<String>(
                                  activeColor: ColorConstant.kPrimary900Color,
                                  value: address.title,
                                  groupValue: myAddressController.selectedAddressTitle.value,
                                  onChanged: (value) {
                                    if (value != null) {
                                      myAddressController.setSelectedAddress(value);
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
