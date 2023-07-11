import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/features/data/model/drawer_bottons.dart';
import 'package:fullfill_admin_web_portal/features/view/auth/login.dart';
import 'package:fullfill_admin_web_portal/features/view/home/widgets/time_date.dart';
import 'package:fullfill_admin_web_portal/features/view_model/drawer/select_button_index.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';
import 'package:fullfill_admin_web_portal/utils/functions/alert_message.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<DrawerButtonsInfo> drawerButtons = [
      DrawerButtonsInfo(title: "Home", icon: Icons.home),
      DrawerButtonsInfo(title: "Contacts", icon: Icons.contact_phone_rounded),
      DrawerButtonsInfo(title: "Riders", icon: Icons.delivery_dining),
      DrawerButtonsInfo(title: "Sellers", icon: Icons.storefront),
      DrawerButtonsInfo(title: "Users", icon: Icons.supervised_user_circle),
    ];
    return Drawer(
      elevation: 0,
      backgroundColor: KColors.drawerBgColor,
      child: Padding(
        padding: const EdgeInsets.all(KSizes.smallPadding * 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!ResponsiveLayout.isComputer())
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: KColors.neutralColor,
                    ),
                  ),
                ],
              ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: List.generate(
                  drawerButtons.length,
                  (index) => Column(
                    children: [
                      Consumer<SelectButton>(
                        builder: (context, selectButton, _) {
                          return Container(
                            decoration: selectButton.selectedIndex == index
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      colors: [
                                        KColors.primary.withOpacity(0.9),
                                        KColors.secondary.withOpacity(0.9),
                                      ],
                                    ),
                                  )
                                : null,
                            child: ListTile(
                              title: Text(
                                drawerButtons[index].title,
                                style: const TextStyle(
                                  color: KColors.neutralColor,
                                ),
                              ),
                              leading: Padding(
                                padding:
                                    const EdgeInsets.all(KSizes.smallPadding),
                                child: Icon(
                                  drawerButtons[index].icon,
                                  color: KColors.neutralColor,
                                ),
                              ),
                              splashColor: KColors.primary,
                              onTap: () => selectButton.selectIndex(index),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          );
                        },
                      ),
                      if (index != drawerButtons.length - 1)
                        const Divider(
                          color: KColors.neutralColor,
                          thickness: 0.1,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            if (ResponsiveLayout.isComputer()) const TimeDateWidget(),
            const SizedBox(height: KSizes.padding),
            ListTile(
              title: const Text(
                "Log out",
                style: TextStyle(
                  color: KColors.neutralColor,
                ),
              ),
              leading: const Icon(
                Icons.logout,
                color: KColors.neutralColor,
              ),
              splashColor: KColors.drawerBgColor,
              onTap: () {
                showAlertMessege(context,
                    title: 'Sign Out ???',
                    message: "Are you sure do you want to sign out",
                    onOKTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
