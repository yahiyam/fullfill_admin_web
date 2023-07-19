import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';

class AuthTopLeft extends StatelessWidget {
  const AuthTopLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Text(
          "Welcome",
          style: TextStyle(
            color: KColors.neutralColor,
            fontSize: KSizes.screenWidth(3),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
