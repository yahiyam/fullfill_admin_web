import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/constants/text_strings.dart';

class AuthBottomRight extends StatelessWidget {
  const AuthBottomRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.person,
              color: KColors.secondary,
              size: KSizes.screenWidth(2),
            ),
            const SizedBox(width: 8),
            Text(
              KTexts.developerName,
              style: TextStyle(
                color: KColors.secondary,
                fontSize: KSizes.screenWidth(1.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
