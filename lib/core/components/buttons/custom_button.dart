import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app_mobile/core/components/text/custom_text.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';

enum CustomButtonType {
  primary,
  secondary,
}

class CustomButton extends StatefulWidget {
  final CustomButtonType type;
  final Function()? onPress;
  final String? buttonTitle;
  final double? width;
  final double borderWidth;
  final Color? color;
  final Color shadowColor;
  final Color? disabledBackgroundColor;
  final double height;
  final double radius;
  final double elevation;
  final double? textSize;
  final String? iconName;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? textColor;
  final Color? borderColor;
  final Color? iconColor;
  final String? rightIcon;
  final String? leftIcon;
  final bool expandTitle;
  final Widget? child;
  const CustomButton({
    Key? key,
    required this.onPress,
    this.type = CustomButtonType.primary,
    this.buttonTitle,
    this.width,
    this.borderWidth = 1.0,
    this.color,
    this.shadowColor = ColorConstant.kPrimary900Color,
    this.disabledBackgroundColor,
    this.height = 48,
    this.radius = DesignConstant.kRadius10,
    this.elevation = 10,
    this.textSize = DesignConstant.kBody0FontSize,
    this.iconName,
    this.padding,
    this.margin,
    this.textColor,
    this.borderColor,
    this.iconColor = ColorConstant.kWhiteColor,
    this.rightIcon,
    this.leftIcon,
    this.expandTitle = true,
    this.child,
  }) : super(key: key);
  bool get enabled => onPress != null;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) => Container(
      height: widget.height,
      width: widget.width,
      margin: widget.margin,
      constraints: widget.width != null
          ? BoxConstraints(
              maxWidth: widget.width!,
            )
          : null,
      child: ElevatedButton(
        style: widget.type == CustomButtonType.primary
            ? ElevatedButton.styleFrom(
                foregroundColor: ColorConstant.kWhiteColor,
                disabledMouseCursor: SystemMouseCursors.basic,
                backgroundColor: widget.color ?? ColorConstant.kPrimary900Color,
                disabledForegroundColor: ColorConstant.kDisabledColor,
                disabledBackgroundColor: widget.disabledBackgroundColor ?? ColorConstant.kDisabledColor,
                padding: widget.padding ?? EdgeInsets.zero,
                side: BorderSide(
                  width: widget.borderWidth,
                  color: widget.borderColor ?? ColorConstant.kPrimary200Color,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                ),
                elevation: widget.color == ColorConstant.kWhiteColor ? 0 : widget.elevation,
              )
            : ElevatedButton.styleFrom(
                foregroundColor: ColorConstant.kWhiteColor,
                disabledMouseCursor: SystemMouseCursors.basic,
                backgroundColor: widget.color ?? ColorConstant.kWhiteColor,
                disabledForegroundColor: ColorConstant.kDisabledColor,
                disabledBackgroundColor: widget.disabledBackgroundColor ?? ColorConstant.kDisabledColor,
                padding: widget.padding ?? EdgeInsets.zero,
                shadowColor: ColorConstant.kWhiteColor,
                elevation: 0.0,
                side: BorderSide(
                  width: widget.borderWidth,
                  color: widget.borderColor ?? ColorConstant.kPrimary200Color,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                ),
              ),
        onPressed: widget.onPress,
        child: widget.iconName != null
            ? SvgPicture.asset(
                widget.iconName!,
                fit: BoxFit.contain,
                allowDrawingOutsideViewBox: true,
                colorFilter: ColorFilter.mode(widget.iconColor ?? ColorConstant.kWhiteColor, BlendMode.srcIn),
              )
            : widget.child ??
                Padding(
                    padding: DesignConstant.kPagePadding10,
                    child: widget.child ??
                        Row(
                          mainAxisAlignment:
                              widget.expandTitle ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                          children: [
                            widget.leftIcon != null
                                ? SvgPicture.asset(
                                    widget.leftIcon ?? "",
                                    fit: BoxFit.contain,
                                    height: DesignConstant.kButtonHeight15,
                                  )
                                : const SizedBox.shrink(),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: (widget.leftIcon != null || widget.rightIcon != null) ? 5.0 : 0),
                                child: CustomText(
                                  fontFamily: DesignConstant.kDMSans,
                                  textAlign: TextAlign.center,
                                  text: widget.buttonTitle ?? "",
                                  textColor: widget.type == CustomButtonType.primary
                                      ? widget.textColor ?? ColorConstant.kWhiteColor
                                      : widget.textColor ?? ColorConstant.kPrimary900Color,
                                  fontWeight: DesignConstant().kRegular,
                                  textSize: widget.textSize,
                                ),
                              ),
                            ),
                            widget.rightIcon != null
                                ? SvgPicture.asset(
                                    widget.rightIcon ?? "",
                                    fit: BoxFit.contain,
                                    height: DesignConstant.kButtonHeight15,
                                    colorFilter: ColorFilter.mode(
                                        widget.iconColor ?? ColorConstant.kWhiteColor, BlendMode.srcIn),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        )),
      ));
}
