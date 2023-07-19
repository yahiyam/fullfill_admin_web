import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';

class CustumAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustumAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 60),
      child: ResponsiveLayout(
        phone: AppBar(
          title: const Text(
            'Admin Panel',
            style: TextStyle(
              fontSize: 30,
              color: KColors.neutralColor,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            color: KColors.neutralColor,
            iconSize: 30,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          backgroundColor: KColors.appBarBgColor,
        ),
        tablet: AppBar(
          title: const Text(
            'Admin Panel',
            style: TextStyle(
              fontSize: 30,
              color: KColors.neutralColor,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            color: KColors.neutralColor,
            iconSize: 30,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          backgroundColor: KColors.appBarBgColor,
        ),
        computer: AppBar(
          title: const Text(
            'Admin Panel',
            style: TextStyle(
              fontSize: 30,
              color: KColors.neutralColor,
            ),
          ),
          centerTitle: true,
          backgroundColor: KColors.appBarBgColor,
          automaticallyImplyLeading: false,
        ),
      ),
    );
  }
}
