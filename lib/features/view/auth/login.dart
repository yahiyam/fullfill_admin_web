import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/features/view/auth/widgets/login_layout.dart';

import 'widgets/auth_back_ground.dart';
import 'widgets/auth_bottom_left.dart';
import 'widgets/auth_bottom_right.dart';
import 'widgets/auth_top_left.dart';
import 'widgets/auth_top_right.dart';

class LoginPage extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: KSizes.screenWidth(),
        height: KSizes.screenHeight(),
        child: const Stack(
          children: [
            AuthBackGround(),
            AuthTopLeft(),
            AuthTopRight(),
            LoginLayout(),
            AuthBottomLeft(),
            AuthBottomRight(),
          ],
        ),
      ),
    );
  }
}
