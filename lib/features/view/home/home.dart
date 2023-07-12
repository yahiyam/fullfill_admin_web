import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/view/contacts/contacts_page.dart';
import 'package:fullfill_admin_web_portal/features/view/drawer/drawer_page.dart';
import 'package:fullfill_admin_web_portal/features/view/home/widgets/custom_app_bar.dart';
import 'package:fullfill_admin_web_portal/features/view/riders/riders_info.dart';
import 'package:fullfill_admin_web_portal/features/view/riders/riders_page.dart';
import 'package:fullfill_admin_web_portal/features/view/sellers/sellers_page.dart';
import 'package:fullfill_admin_web_portal/features/view/users/users_info.dart';
import 'package:fullfill_admin_web_portal/features/view/sellers/sellers_info.dart';
import 'package:fullfill_admin_web_portal/features/view/users/users_page.dart';
import 'package:fullfill_admin_web_portal/features/view_model/drawer/select_button_index.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustumAppBar(),
      drawer: const DrawerPage(),
      body: Consumer<SelectedDrawer>(builder: (context, drawer, _) {
        return ResponsiveLayout(
          smartwatch: Container(),
          phone: drawer.selectedIndex == 0
              ? const Column(children: [
                  Flexible(child: SellersInfo()),
                  Flexible(child: UsersInfo()),
                  Flexible(child: RidersInfo()),
                ])
              : drawer.selectedIndex == 1
                  ? const ContactsPage()
                  : drawer.selectedIndex == 2
                      ? const RidersInfo()
                      : drawer.selectedIndex == 3
                          ? const SellersInfo()
                          : const UsersInfo(),
          tablet: drawer.selectedIndex == 0
              ? const Row(children: [
                  Expanded(child: UsersInfo()),
                  Expanded(child: SellersInfo()),
                ])
              : drawer.selectedIndex == 1
                  ? const ContactsPage()
                  : drawer.selectedIndex == 2
                      ? const RidersPage()
                      : drawer.selectedIndex == 3
                          ? const SellersPage()
                          : const UsersPage(),
          largeTablet: drawer.selectedIndex == 0
              ? const Row(children: [
                  Expanded(child: UsersInfo()),
                  Expanded(child: RidersInfo()),
                  Expanded(child: SellersInfo()),
                ])
              : drawer.selectedIndex == 1
                  ? const ContactsPage()
                  : drawer.selectedIndex == 2
                      ? const RidersPage()
                      : drawer.selectedIndex == 3
                          ? const SellersPage()
                          : const UsersPage(),
          computer: drawer.selectedIndex == 0
              ? const Row(children: [
                  DrawerPage(),
                  Expanded(child: UsersInfo()),
                  Expanded(child: RidersInfo()),
                  Expanded(child: SellersInfo()),
                ])
              : drawer.selectedIndex == 1
                  ? const Row(children: [
                      DrawerPage(),
                      Expanded(child: ContactsPage())
                    ])
                  : drawer.selectedIndex == 2
                      ? const Row(children: [
                      DrawerPage(),
                      Expanded(child: RidersPage())
                    ])
                      : drawer.selectedIndex == 3
                          ? const Row(children: [
                      DrawerPage(),
                      Expanded(child: SellersPage())
                    ])
                          : const Row(children: [
                      DrawerPage(),
                      Expanded(child: UsersPage())
                    ]),
        );
      }),
    );
  }
}
