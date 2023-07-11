import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/view/drawer/drawer_page.dart';
import 'package:fullfill_admin_web_portal/features/view/home/widgets/custom_app_bar.dart';
import 'package:fullfill_admin_web_portal/features/view/riders/riders_info.dart';
import 'package:fullfill_admin_web_portal/features/view/users/users_info.dart';
import 'package:fullfill_admin_web_portal/features/view/sellers/sellers_info.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustumAppBar(),
      drawer: const DrawerPage(),
      body: ResponsiveLayout(
        smartwatch: Container(),
        phone: const Column(children: [
          Expanded(child: SellersInfo()),
          Expanded(child: UsersInfo()),
          Expanded(child: RidersInfo()),
        ]),
        tablet: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              Flexible(child: UsersInfo()),
              Flexible(child: SellersInfo()),
            ]),
            Row(children: [
              Flexible(child: RidersInfo()),
            ]),
          ],
        ),
        largeTablet: const Row(children: [
          Expanded(child: UsersInfo()),
          Expanded(child: RidersInfo()),
          Expanded(child: SellersInfo()),
        ]),
        computer: const Row(children: [
          DrawerPage(),
          Expanded(child: UsersInfo()),
          Expanded(child: RidersInfo()),
          Expanded(child: SellersInfo()),
        ]),
      ),
    );
  }
}
