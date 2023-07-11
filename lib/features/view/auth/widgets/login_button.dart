import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/features/data/services/admin_auth_service.dart';
import 'package:fullfill_admin_web_portal/features/view/home/home.dart';
import 'package:fullfill_admin_web_portal/features/view_model/auth/login_provider.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, _) {
        return GestureDetector(
          onTap: () {
            if (loginProvider.loginFormKey.currentState!.validate()) {
              AdminAuthService.loginWithEmail(
                loginProvider.emailController.toString().trim(),
                loginProvider.passwordController.toString().trim(),
                (String? error) {
                  if (error == null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  } else {
                    final snackBar = SnackBar(
                      content: Text(
                        error,
                        style: const TextStyle(
                          fontSize: 36,
                          color: Colors.black,
                        ),
                      ),
                      backgroundColor: Colors.cyan,
                      duration: const Duration(seconds: 6),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              );
            }
          },
          child: Container(
            height: 50,
            width: double.infinity,
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
              color: KColors.analogous2Primary,
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: KColors.primary.withOpacity(0.2),
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
                  color: KColors.neutralColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
