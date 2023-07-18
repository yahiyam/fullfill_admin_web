import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/detail_page_tabbar.dart';

class DetailPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailPageAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 40,
          color: KColors.lighterShade2Primary,
        ),
      ),
      centerTitle: true,
      backgroundColor: KColors.appBarBgColor,
      bottom: const DetailPageTabBar(),
    );
  }
}
