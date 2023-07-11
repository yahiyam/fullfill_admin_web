import 'package:flutter/material.dart';

class DrawerButtonsInfo {
  final String title;
  final IconData icon;
  final Widget? navigate;
  final VoidCallback? onTap;

  DrawerButtonsInfo({
    required this.title,
    required this.icon,
    this.navigate,
    this.onTap,
  });
}

