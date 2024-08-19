import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shop_app_mobile/core/components/text/custom_text_form_field.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';

// ignore: must_be_immutable
class SearchBarWidget extends CustomTextFormField {
  @override
  // ignore: overridden_fields
  final String placeHolder;
  final Color? prefixIconColor;
  final Widget? prefix;
  final Color? backgroundColor;
  SearchBarWidget({
    required super.controller,
    required this.placeHolder,
    super.key,
    super.inputFormatter = const [],
    super.onChanged,
    super.suffixIcon,
    this.prefix,
    this.backgroundColor,
    this.prefixIconColor,
  }) : super(
          borderColor: ColorConstant.kPrimary100Color,
          enabledBorderColor: ColorConstant.kPrimary800Color,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          prefixIcon: prefix ??
              SizedBox.fromSize(
                size: const Size.square(16),
                child: SvgPicture.asset(
                  "assets/icons/search.svg",
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(prefixIconColor ?? ColorConstant.kPrimary300Color, BlendMode.srcIn),
                ),
              ),
        );
}
