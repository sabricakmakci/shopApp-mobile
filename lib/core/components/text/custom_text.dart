import 'package:flutter/material.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';

// ignore: must_be_immutable
class CustomText extends StatefulWidget {
  final String text;
  final Color textColor;
  final double? textSize;
  FontWeight? fontWeight = DesignConstant().kRegular;
  final double lineHeight;
  final TextDecoration textDecoration;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final int? maxLine;
  final String? fontFamily;
  final bool? softWrap;
  final bool isTitle;
  CustomText({
    Key? key,
    required this.text,
    this.textColor = ColorConstant.kPrimary900Color,
    this.textSize,
    this.fontWeight,
    this.lineHeight = 1.2,
    this.textDecoration = TextDecoration.none,
    this.textAlign = TextAlign.start,
    this.textOverflow = TextOverflow.ellipsis,
    this.maxLine,
    this.fontFamily,
    this.softWrap,
    this.isTitle = false,
  }) : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Text(
        widget.text,
        maxLines: widget.maxLine,
        overflow: widget.textOverflow,
        style: TextStyle(
            letterSpacing: widget.isTitle ? -0.3 : -0.02,
            overflow: widget.textOverflow,
            decoration: widget.textDecoration,
            color: widget.textColor,
            fontSize: widget.textSize,
            height: widget.lineHeight,
            fontFamily: widget.fontFamily ?? DesignConstant.kDMSans,
            fontWeight: widget.fontWeight ?? DesignConstant().kRegular),
        softWrap: widget.softWrap,
        textAlign: widget.textAlign,
      );
}
