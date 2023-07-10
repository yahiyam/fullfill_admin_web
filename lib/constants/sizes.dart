import 'package:flutter/material.dart';

class KSizes {
  static late Size size;

  static double width([double percentage = 100]) {
    return size.width * percentage / 100;
  }

  static double height([double percentage = 100]) {
    return size.height * percentage / 100;
  }

  static double border = 30.0;
  static double splashContainer = 30.0;
  static const double smallPadding = 10.0;
}
