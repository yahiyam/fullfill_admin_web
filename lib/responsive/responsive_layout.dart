import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget? smartwatch;
  final Widget? smallPhone;
  final Widget phone;
  final Widget? miniTablet;
  final Widget tablet;
  final Widget? largeTablet;
  final Widget computer;

  const ResponsiveLayout({
    super.key,
    this.smartwatch,
    this.smallPhone,
    required this.phone,
    this.miniTablet,
    required this.tablet,
    this.largeTablet,
    required this.computer,
  });

  static const int smartwatchMinWidth = 200;
  static const int smallPhoneMinWidth = 375;
  static const int phoneMinWidth = 414;
  static const int miniTabletMinWidth = 768;
  static const int tabletMinWidth = 820;
  static const int largeTabletMinWidth = 912;
  static const int computerMinWidth = 1024;

  static bool isSmartwatch() => Screen.width() <= smartwatchMinWidth;
  static bool isSmallPhone() => Screen.width() <= smallPhoneMinWidth;
  static bool isPhone() => Screen.width() <= phoneMinWidth;
  static bool isMiniTablet() => Screen.width() <= miniTabletMinWidth;
  static bool isTablet() => Screen.width() <= tabletMinWidth;
  static bool isLargeTablet() => Screen.width() <= largeTabletMinWidth;
  static bool isComputer() => Screen.width() <= computerMinWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isSmartwatch()) {
          return smartwatch ?? phone;
        } else if (isSmallPhone()) {
          return smallPhone ?? phone;
        } else if (isPhone()) {
          return phone;
        } else if (isMiniTablet()) {
          return miniTablet ?? tablet;
        } else if (isTablet()) {
          return tablet;
        } else if (isLargeTablet()) {
          return largeTablet ?? tablet;
        }
        return computer;
      },
    );
  }
}
