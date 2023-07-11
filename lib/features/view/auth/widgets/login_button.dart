import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
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
              loginProvider.login().then(
                    (value) => {
                      if (loginProvider.errorMessage == null)
                        {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          ),
                        }
                      else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(loginProvider.errorMessage!),
                            ),
                          ),
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
