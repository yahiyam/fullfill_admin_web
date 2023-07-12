import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';

class DivisionHeader extends StatelessWidget {
  const DivisionHeader({
    super.key,
    required this.title,
    required this.count,
    required this.isLoading,
  });

  final String title;
  final int count;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(
                color: KColors.neutralColor,
                fontSize: 25,
              ),
            ),
            trailing: !isLoading
                ? Chip(
                    shape: const OvalBorder(),
                    label: Text(
                      count.toString(),
                      style: const TextStyle(color: KColors.analogous1Primary),
                    ),
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
