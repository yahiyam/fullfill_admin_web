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
import 'package:fullfill_admin_web_portal/features/view_model/riders/riders_provider.dart';
import 'package:fullfill_admin_web_portal/features/view_model/sellers/sellers_provider.dart';
import 'package:fullfill_admin_web_portal/features/view_model/users/users_provider.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';
import 'package:fullfill_admin_web_portal/utils/functions/alert_message.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ridersProvider = Provider.of<RiderProvider>(context, listen: false);
    ridersProvider.fetchAllRiders((error) => showAlertMessege(
          context,
          title: 'Error fetching all riders',
          message: error ?? 'error showing error ;)',
        ));
    final sellersProvider = Provider.of<SellerProvider>(context, listen: false);
    sellersProvider.fetchAllSellers((error) => showAlertMessege(
          context,
          title: 'Error fetching all sellers',
          message: error ?? 'error showing error ;)',
        ));
    final usersProvider = Provider.of<UserProvider>(context, listen: false);
    usersProvider.fetchAllUsers((error) => showAlertMessege(
          context,
          title: 'Error fetching all users',
          message: error ?? 'error showing error ;)',
        ));
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
              ? const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
              ? const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
              ? const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      DrawerPage(),
                      Expanded(child: UsersInfo()),
                      Expanded(child: RidersInfo()),
                      Expanded(child: SellersInfo()),
                    ])
              : drawer.selectedIndex == 1
                  ? const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [DrawerPage(), Expanded(child: ContactsPage())])
                  : drawer.selectedIndex == 2
                      ? const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              DrawerPage(),
                              Expanded(child: RidersPage())
                            ])
                      : drawer.selectedIndex == 3
                          ? const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  DrawerPage(),
                                  Expanded(child: SellersPage())
                                ])
                          : const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  DrawerPage(),
                                  Expanded(child: UsersPage())
                                ]),
        );
      }),
    );
  }
}
