import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';

class DivisionSnapCard extends StatelessWidget {
  const DivisionSnapCard({
    super.key,
    required this.title,
    this.onTap,
    required this.itemCount,
  });
  final String title;
  final Function()? onTap;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
          color: KColors.lighterShade2Secondary,
          borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: KColors.secondary,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'blocked user $index',
                    style: const TextStyle(
                      color: KColors.neutralColor,
                    ),
                  ),
                  leading: const CircleAvatar(),
                );
              },
            ),
            TextButton(
              onPressed: onTap,
              child: const Text(
                'show more',
                style: TextStyle(
                  color: KColors.analogous1Primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
