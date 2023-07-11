import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/data/services/admin_auth_service.dart';

class LoginProvider extends ChangeNotifier {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? errorMessage;

  Future<void> login() async {
    errorMessage = null;

    if (loginFormKey.currentState?.validate() ?? false) {
      try {
        await AdminAuthService.loginWithEmail(
          emailController.text,
          passwordController.text,
          (String? error) {
            if (error != null) {
              errorMessage = error;
            }
            notifyListeners();
          },
        );
      } catch (error) {
        errorMessage = error.toString();
        notifyListeners();
      }
    }
  }
}
