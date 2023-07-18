import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/constants/text_strings.dart';

class EmptyPageMessage extends StatelessWidget {
  const EmptyPageMessage({
    super.key,
    required this.messege,
  });
  final String messege;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            KTexts.sadFace,
            style: TextStyle(
              fontSize: 100,
              color: KColors.complementarySecondary,
            ),
          ),
          Text(
            messege,
            style: const TextStyle(
              fontSize: 25,
              color: KColors.complementarySecondary,
            ),
          ),
        ],
      ),
    );
  }
}
