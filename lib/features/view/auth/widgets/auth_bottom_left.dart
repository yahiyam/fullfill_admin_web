import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/constants/text_strings.dart';

class AuthBottomLeft extends StatelessWidget {
  const AuthBottomLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              KTexts.appName,
              style: TextStyle(
                color: KColors.neutralColor,
                fontSize: KSizes.screenWidth(2),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              KTexts.appTagLine,
              style: TextStyle(
                color: KColors.neutralColor,
                fontSize: KSizes.screenWidth(1.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
