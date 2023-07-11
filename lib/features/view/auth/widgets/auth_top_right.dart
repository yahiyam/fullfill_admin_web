

import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/constants/image_strings.dart';

class AuthTopRight extends StatelessWidget {
  const AuthTopRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: CircleAvatar(
          radius: 60,
          backgroundColor: KColors.lighterShade1Secondary,
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              KColors.neutralColor,
              BlendMode.srcIn,
            ),
            child: Container(
              width: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(KImages.appLogo),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
