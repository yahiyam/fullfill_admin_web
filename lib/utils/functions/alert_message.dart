import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';

Future<dynamic> showAlertMessege(
  BuildContext context, {
  required String message,
  String? title,
  Function? onOKTap,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title ?? 'Alert Message'),
        content: Text(message),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: KColors.analogous1Secondary),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (onOKTap != null) {
                    onOKTap();
                  }
                },
                child: const Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(color: KColors.accentColor),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
