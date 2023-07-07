import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget tiny;
  final Widget phone;
  final Widget tablet;
  final Widget largeTablet;
  final Widget computer;

  const ResponsiveLayout({
    super.key,
    required this.tiny,
    required this.phone,
    required this.tablet,
    required this.largeTablet,
    required this.computer,
  });

  static const int tinyHeightLimit = 100;
  static const int tinyLimit = 270;
  static const int phoneLimit = 550;
  static const int tabletLimit = 800;
  static const int largeTabletLimit = 1100;

  static bool isTinyHeightLimit(BuildContext context) =>
      MediaQuery.sizeOf(context).height < tinyHeightLimit;

  static bool isTinyLimit(BuildContext context) =>
      MediaQuery.sizeOf(context).width < tinyLimit;

  static bool isPhone(BuildContext context) =>
      MediaQuery.sizeOf(context).width < phoneLimit &&
      MediaQuery.sizeOf(context).width >= tinyLimit;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width < tabletLimit &&
      MediaQuery.sizeOf(context).width >= phoneLimit;

  static bool isLargeTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width < largeTabletLimit &&
      MediaQuery.sizeOf(context).width >= tabletLimit;

  static bool isComputer(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= largeTabletLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < tinyLimit ||
            constraints.maxHeight < tinyHeightLimit) {
          return tiny;
        }
        if (constraints.maxWidth < phoneLimit) {
          return phone;
        }
        if (constraints.maxWidth < tabletLimit) {
          return tablet;
        }
        if (constraints.maxWidth < largeTabletLimit) {
          return largeTablet;
        } else {
          return computer;
        }
      },
    );
  }
}
