import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/features/view_model/home/time_date.dart';

class TimeDateWidget extends StatelessWidget {
  const TimeDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DateTimeProvider>(
      builder: (context, dateTimeProvider, _) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dateTimeProvider.currentTimeString,
                style: const TextStyle(
                  fontSize: 20,
                  color: KColors.complementarySecondary,
                ),
              ),
              const SizedBox(height: KSizes.smallPadding),
              Text(
                dateTimeProvider.currentDateString,
                style: const TextStyle(
                  fontSize: 20,
                  color: KColors.complementarySecondary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
