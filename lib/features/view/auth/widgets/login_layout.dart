import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/features/view/auth/widgets/custom_text_field.dart';
import 'package:fullfill_admin_web_portal/features/view/auth/widgets/login_button.dart';
import 'package:fullfill_admin_web_portal/features/view_model/auth/login_provider.dart';
import 'package:provider/provider.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(64),
      child: Center(
        child: Card(
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: KSizes.screenHeight(60),
            width: 500,
            decoration: BoxDecoration(
              color: KColors.neutralColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Consumer<LoginProvider>(
                      builder: (context, loginProvider, _) {
                    return Form(
                      key: loginProvider.loginFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "LOG IN",
                            style: TextStyle(
                              fontSize: 18,
                              color: KColors.darkerShade2Primary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const SizedBox(
                            width: 40,
                            child: Divider(
                              color: KColors.analogous1Primary,
                              thickness: 2,
                            ),
                          ),
                          const SizedBox(height: 32),
                          CustomTextField(
                            controller: loginProvider.emailController,
                            labelText: 'Email address',
                            hintText: 'Email',
                            icon: Icons.mail_outline,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 32),
                          CustomTextField(
                            controller: loginProvider.passwordController,
                            obscureText: true,
                            hintText: 'Password',
                            labelText: 'Password',
                            icon: Icons.password_rounded,
                            showSuffixIcon: true,
                          ),
                          const SizedBox(height: 64),
                          const LoginButton(),
                          const SizedBox(height: 32),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
