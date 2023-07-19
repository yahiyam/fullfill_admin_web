import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';

class DetailPageTabBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailPageTabBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      isScrollable: true,
      indicatorWeight: 4,
      dividerColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      unselectedLabelColor: KColors.complementarySecondary,
      unselectedLabelStyle: TextStyle(fontSize: 20),
      labelColor: KColors.primary,
      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      indicatorColor: KColors.primary,
      tabs: [
        Tab(text: 'Verified'),
        Tab(text: 'Blocked'),
      ],
    );
  }
}
