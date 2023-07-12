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

  // static const int smartwatchMinWidth = 200;
  // static const int smallPhoneMinWidth = 375;
  // static const int phoneMinWidth = 414;
  // static const int miniTabletMinWidth = 768;
  // static const int tabletMinWidth = 820;
  // static const int largeTabletMinWidth = 912;
  // static const int computerMinWidth = 1024;

  // static bool isSmartwatch() => KSizes.screenWidth() <= smartwatchMinWidth;
  // static bool isSmallPhone() => KSizes.screenWidth() <= smallPhoneMinWidth;
  // static bool isPhone() => KSizes.screenWidth() <= phoneMinWidth;
  // static bool isMiniTablet() => KSizes.screenWidth() <= miniTabletMinWidth;
  // static bool isTablet() => KSizes.screenWidth() <= tabletMinWidth;
  // static bool isLargeTablet() => KSizes.screenWidth() <= largeTabletMinWidth;
  // static bool isComputer() => KSizes.screenWidth() <= computerMinWidth;

  static const int tinyHeightLimit = 100;
  static const int tinyLimit = 270;
  static const int phoneLimit = 550;
  static const int tabletLimit = 800;
  static const int largeTabletLimit = 1350;
  static const int smallPhoneMinWidth = 375;
  static const int smartwatchMinWidth = 200;
  static const int miniTabletMinWidth = 768;

  static bool isSmartwatch() => KSizes.screenWidth() <= smartwatchMinWidth;
  static bool isSmallPhone() => KSizes.screenWidth() <= smallPhoneMinWidth;
  static bool isMiniTablet() => KSizes.screenWidth() <= miniTabletMinWidth;

  // static bool isTinyHeightLimit() => KSizes.screenWidth() < tinyHeightLimit;

  // static bool isTinyLimit() => KSizes.screenWidth() < tinyLimit;

  static bool isPhone() =>
      KSizes.screenWidth() < phoneLimit && KSizes.screenWidth() >= tinyLimit;

  static bool isTablet() =>
      KSizes.screenWidth() < tabletLimit && KSizes.screenWidth() >= phoneLimit;

  static bool isLargeTablet() =>
      KSizes.screenWidth() < largeTabletLimit &&
      KSizes.screenWidth() >= tabletLimit;

  static bool isComputer() => KSizes.screenWidth() >= largeTabletLimit;

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
