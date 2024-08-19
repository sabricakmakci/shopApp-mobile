import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    Key? key,
    this.isPassword = false,
    this.placeHolder,
    this.headerText,
    this.autoFocus = false,
    this.showClearButton = false,
    this.inputType,
    this.bgColor = ColorConstant.kWhiteColor,
    this.borderColor,
    this.enabledBorderColor,
    this.errorBorderColor,
    this.hintColor,
    this.textColor,
    this.isMasked = false,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onSave,
    this.onClearText,
    this.onEditingComplete,
    this.validate,
    this.onFieldSubmitted,
    this.focusNode,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength = 100,
    this.isOpacityColor = false,
    this.inputFormatter = const [],
    this.controller,
    this.isShowPassEye = false,
    this.contentPadding,
    this.readOnly = false,
    this.isCenter = false,
    this.suffixIcon,
    this.prefixIcon,
    this.showPlaceHolderIcon = true,
    this.hintHeight,
    this.showLabelAlways = false,
    this.enableInteractiveSelection,
  }) : super(key: key);

  bool isPassword;
  final String? placeHolder;
  final String? headerText;
  final bool autoFocus;
  final bool showClearButton;
  final TextInputType? inputType;
  final Color bgColor;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final Color? errorBorderColor;
  final Color? hintColor;
  final Color? textColor;
  final bool isMasked;
  final TextCapitalization textCapitalization;
  final Function(String?)? onChanged;
  final Function(String?)? onSave;
  final Function()? onClearText;
  final Function()? onEditingComplete;
  final String? Function(String?)? validate;
  final Function(String?)? onFieldSubmitted;
  final FocusNode? focusNode;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool? isOpacityColor;
  final List<TextInputFormatter> inputFormatter;
  final TextEditingController? controller;
  final bool isShowPassEye;
  final EdgeInsets? contentPadding;
  final bool readOnly;
  final bool isCenter;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool showPlaceHolderIcon;
  final double? hintHeight;
  final bool showLabelAlways;
  final bool? enableInteractiveSelection;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isEmptyField = true;
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = widget.controller ?? TextEditingController();
    isEmptyField = textEditingController.text.isEmpty;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.isCenter ? Center(child: textField()) : textField();

  Widget textField() => TextFormField(
        enableInteractiveSelection: widget.enableInteractiveSelection,
        onEditingComplete: widget.onEditingComplete,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        textCapitalization: widget.textCapitalization,
        minLines: widget.minLines,
        controller: textEditingController,
        autofocus: widget.autoFocus,
        focusNode: widget.focusNode,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        readOnly: widget.readOnly,
        validator: widget.validate,
        onChanged: (value) {
          isEmptyField = value.isEmpty;
          setState(() {});
          if (widget.onChanged != null) {
            widget.onChanged?.call(value);
          }
        },
        textInputAction: TextInputAction.done,
        obscureText: widget.isPassword,
        style: TextStyle(
          fontSize: DesignConstant.kBody0FontSize,
          fontFamily: DesignConstant.kDMSans,
          letterSpacing: 0.3,
          color: widget.textColor ?? ColorConstant.kPrimary900Color,
          fontWeight: DesignConstant().kRegular,
        ),
        decoration: InputDecoration(
          filled: true,
          counterText: '',
          fillColor: widget.bgColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: widget.borderColor ?? ColorConstant.kPrimary100Color),
            borderRadius: const BorderRadius.all(Radius.circular(DesignConstant.kRadius10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1, color: widget.enabledBorderColor ?? widget.borderColor ?? ColorConstant.kPrimary400Color),
            borderRadius: const BorderRadius.all(Radius.circular(DesignConstant.kRadius10)),
          ),
          errorMaxLines: 2,
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: widget.errorBorderColor ?? ColorConstant.kErrorColor),
            borderRadius: const BorderRadius.all(Radius.circular(DesignConstant.kRadius10)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: widget.errorBorderColor ?? ColorConstant.kErrorColor),
            borderRadius: const BorderRadius.all(Radius.circular(DesignConstant.kRadius10)),
          ),
          contentPadding: widget.contentPadding ?? const EdgeInsets.only(left: 10.0, right: 5.0, bottom: 0.0, top: 0.0),
          floatingLabelBehavior: widget.showLabelAlways ? FloatingLabelBehavior.always : FloatingLabelBehavior.auto,
          hintText: widget.placeHolder,
          hintStyle: TextStyle(
            fontSize: DesignConstant.kBody0FontSize,
            fontFamily: DesignConstant.kDMSans,
            letterSpacing: 0.3,
            color: widget.textColor ?? ColorConstant.kPrimary400Color,
            fontWeight: DesignConstant().kRegular,
          ),
          prefixIcon: widget.showPlaceHolderIcon && isEmptyField ? widget.prefixIcon : null,
          suffixIcon: suffixIcon(),
          labelStyle: TextStyle(
            fontSize: DesignConstant.kBody0FontSize,
            fontFamily: DesignConstant.kDMSans,
            letterSpacing: 0.3,
            color: widget.textColor ?? ColorConstant.kPrimary900Color,
            fontWeight: DesignConstant().kRegular,
          ),
        ),
        inputFormatters: widget.inputFormatter,
        onSaved: widget.onSave,
        textAlign: widget.isCenter ? TextAlign.center : TextAlign.start,
        onFieldSubmitted: widget.onFieldSubmitted,
        keyboardType: widget.inputType,
      );

  Widget? suffixIcon() {
    if (widget.isShowPassEye && widget.suffixIcon == null) {
      return GestureDetector(
        onTap: () {
          setState(() {
            widget.isPassword = widget.isPassword == false;
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: SvgPicture.asset(
            widget.isPassword ? 'assets/icons/close-eye.svg' : 'assets/icons/open-eye.svg',
            colorFilter: const ColorFilter.mode(ColorConstant.kPrimary400Color, BlendMode.srcIn),
            height: 25.0,
          ),
        ),
      );
    } else if (widget.showClearButton && widget.suffixIcon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          clearButton(),
          const SizedBox(width: 10),
          widget.suffixIcon!,
          const SizedBox(width: 10),
        ],
      );
    } else if (widget.showClearButton) {
      return clearButton();
    } else {
      return widget.suffixIcon;
    }
  }

  Widget clearButton() {
    if (!isEmptyField) {
      return GestureDetector(
        child: const Icon(
          CupertinoIcons.clear_circled,
          size: 20,
          color: ColorConstant.kBlackColor,
        ),
        onTap: () {
          if (!widget.readOnly) {
            textEditingController.clear();
            isEmptyField = true;
            widget.onClearText?.call();
            setState(() {});
          }
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
