import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/constants/image_strings.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/constants/text_strings.dart';
import 'package:fullfill_admin_web_portal/features/view/auth/widgets/custom_text_field.dart';
import 'package:fullfill_admin_web_portal/features/view_model/auth/login_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Screen.width(),
        height: Screen.height(),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: Screen.width(50),
                  color: yPrimaryColor,
                ),
                Container(
                  height: double.infinity,
                  width: Screen.width(50),
                  color: yWhiteColor,
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    color: yWhiteColor,
                    fontSize: Screen.width(3),
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
                      yAppName,
                      style: TextStyle(
                        color: yWhiteColor,
                        fontSize: Screen.width(2),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      yAppTagLine,
                      style: TextStyle(
                        color: yWhiteColor,
                        fontSize: Screen.width(1.2),
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
                  backgroundColor: yPrimaryColor,
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      yWhiteColor,
                      BlendMode.srcIn,
                    ),
                    child: Container(
                      width: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(yAppLogo),
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
                      color: yGreyColor,
                      size: Screen.width(2),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      yDevName,
                      style: TextStyle(
                        color: yGreyColor,
                        fontSize: Screen.width(1.2),
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
            height: Screen.height(60),
            width: 500,
            decoration: BoxDecoration(
              color: yWhiteColor,
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
                          Text(
                            "LOG IN",
                            style: TextStyle(
                              fontSize: 18,
                              color: yGreyColor[700],
                            ),
                          ),
                          const SizedBox(height: 8),
                          const SizedBox(
                            width: 30,
                            child: Divider(
                              color: yPrimaryColor,
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
                          GestureDetector(
                            onTap: () {
                              if (loginProvider.loginFormKey.currentState!
                                  .validate()) {}
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              alignment: FractionalOffset.center,
                              decoration: BoxDecoration(
                                color: yPrimaryColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(25),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: yPrimaryColor.withOpacity(0.2),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                    color: yWhiteColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
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
