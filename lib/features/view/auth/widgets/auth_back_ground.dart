import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';

class AuthBackGround extends StatelessWidget {
  const AuthBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: double.infinity,
          width: KSizes.screenWidth(50),
          color: KColors.primary,
        ),
        Container(
          height: double.infinity,
          width: KSizes.screenWidth(50),
          color: KColors.lighterShade2Secondary,
        ),
      ],
    );
  }
}
