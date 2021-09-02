import 'package:flutter/material.dart';

class Size {
  static double getWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static getTextSize(double factor, context) {
    double width = getWidth(context);
    if (width > 800) {
      double max = 20;
      double size = width / 100 * factor;
      return size > max ? max : size;
    } else {
      double max = 18;
      double size = width / 50 * factor;
      return size > max ? max : size;
    }
  }
}
