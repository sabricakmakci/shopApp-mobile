import 'dart:io';

import 'package:flutter/material.dart';

class DeviceUtils {
  static bool get isAndroid => Platform.isAndroid;
  static bool get isIOS => Platform.isIOS;

  static double getWidth(BuildContext context) => MediaQuery.sizeOf(context).width;

  static double getHeight(BuildContext context) => MediaQuery.sizeOf(context).height;

  static double getScaledWidth(BuildContext context, double scale) => scale * getWidth(context);

  static double getScaledSize(BuildContext context, double scale) =>
      scale * (MediaQuery.orientationOf(context) == Orientation.portrait ? getWidth(context) : getHeight(context));
}
