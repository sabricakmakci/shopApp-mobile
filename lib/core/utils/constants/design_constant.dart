import 'package:flutter/material.dart';

class DesignConstant {
  /// Body Text Sizes
  static const kBody3FontSize = 10.0;
  static const kBody2FontSize = 12.0;
  static const kBody1FontSize = 14.0;
  static const kBody0FontSize = 16.0;

  /// Header Text Sizes
  static const kHeadline4FontSize = 20.0;
  static const kHeadline3FontSize = 16.0;
  static const kHeadline2FontSize = 18.0;
  static const kHeadline1FontSize = 24.0;
  static const kHeadline0FontSize = 40.0;

  /// Button Sizes
  static const kButtonHeight15 = 15.0;

  /// paddings
  static const kPagePadding16 = EdgeInsets.all(16);
  static const kPagePadding10 = EdgeInsets.all(10);

  static const kPageHorizontalPadding16 = EdgeInsets.symmetric(horizontal: 16);

  /// radius
  static const kRadius8 = 8.0;
  static const kRadius10 = 10.0;

  /// Font Weight
  FontWeight get kLight {
    return FontWeight.w400;
  }

  FontWeight get kRegular {
    return FontWeight.w500;
  }

  FontWeight get kSemiBold {
    return FontWeight.w600;
  }

  FontWeight get kBold {
    return FontWeight.w700;
  }

  /// Font Family
  String kFontFamily = kDMSans;
  static const String kDMSans = "DMSans";
}
