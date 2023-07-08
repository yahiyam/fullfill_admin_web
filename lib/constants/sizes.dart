import 'package:flutter/material.dart';

const defaultPadding = 16.0;

class Screen {
  static late Size size;

  static double width([double percentage = 100]) {
    return size.width * percentage / 100;
  }

  static double height([double percentage = 100]) {
    return size.height * percentage / 100;
  }
}
