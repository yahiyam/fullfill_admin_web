import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/constants/image_strings.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/constants/text_strings.dart';
import 'package:fullfill_admin_web_portal/features/view/auth/widgets/login_layout.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: KSizes.width(),
        height: KSizes.height(),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: KSizes.width(50),
                  color: KColors.primary,
                ),
                Container(
                    height: double.infinity,
                    width: KSizes.width(50),
                    color: KColors.lighterShade2Secondary),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    color: KColors.neutralColor,
                    fontSize: KSizes.width(3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const LoginLayout(),
            Align(
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
                        fontSize: KSizes.width(2),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      KTexts.appTagLine,
                      style: TextStyle(
                        color: KColors.neutralColor,
                        fontSize: KSizes.width(1.2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
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
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.person,
                      color: KColors.secondary,
                      size: KSizes.width(2),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      KTexts.developerName,
                      style: TextStyle(
                        color: KColors.secondary,
                        fontSize: KSizes.width(1.2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
