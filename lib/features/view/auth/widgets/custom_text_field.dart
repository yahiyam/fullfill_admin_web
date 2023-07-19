import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/features/view_model/auth/obscure_provider.dart';

class CustomTextField extends StatelessWidget {
  final bool? obscureText;
  final String? labelText;
  final String? hintText;
  final IconData? icon;

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? showSuffixIcon;
  const CustomTextField({
    super.key,
    @required this.labelText,
    this.hintText,
    this.icon,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.showSuffixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Obscure>(
      builder: (context, obscure, _) {
        return TextFormField(
          obscureText: obscureText! && !obscure.passwordVisible,
          controller: controller,
          keyboardType: keyboardType,
          onChanged: (value) => obscure.toggleTyped(value),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your ${labelText?.toLowerCase()}';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            suffixIcon: Icon(
              icon,
              color: KColors.primary,
            ),
            contentPadding: const EdgeInsets.only(bottom: 10),
            suffix: obscureText! && showSuffixIcon! && obscure.isTyped
                ? IconButton(
                    icon: Icon(
                      obscure.passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      obscure.togglePasswordVisibility();
                      Future.delayed(const Duration(seconds: 2), () {
                        obscure.togglePasswordVisibility();
                      });
                    },
                  )
                : null,
          ),
        );
      },
    );
  }
}
