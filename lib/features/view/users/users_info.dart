import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';

class UsersInfo extends StatelessWidget {
  const UsersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: KSizes.smallPadding,
              top: KSizes.smallPadding,
              left: KSizes.smallPadding,
            ),
            child: Card(
              color: KColors.primary,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                width: double.infinity,
                child: const ListTile(
                  title: Text(
                    "Users",
                    style: TextStyle(
                      color: KColors.neutralColor,
                      fontSize: 25,
                    ),
                  ),
                  trailing: Chip(
                    shape: OvalBorder(),
                    label: Text(
                      "500",
                      style: TextStyle(color: KColors.analogous1Primary),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
