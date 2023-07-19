import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/data/services/admin_auth_service.dart';

class LoginProvider extends ChangeNotifier {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  String? errorMessage;
  bool get isLoading => _isLoading;

  Future<void> login() async {
    errorMessage = null;

    if (loginFormKey.currentState?.validate() ?? false) {
      try {
        _isLoading = true;
        notifyListeners();

        await AdminAuthService.loginWithEmail(
          emailController.text,
          passwordController.text,
          (String? error) {
            if (error != null) {
              errorMessage = error;
            }
            _isLoading = false;
            notifyListeners();
          },
        );
      } catch (error) {
        _isLoading = false;
        errorMessage = error.toString();
        notifyListeners();
      }
    }
  }
}
