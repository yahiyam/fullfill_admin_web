import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/data/model/drawer_bottons.dart';

class DrawerInfo {
  static get drawerButtons => _drawerButtons;

  static final List<DrawerButtonsInfo> _drawerButtons = [
    DrawerButtonsInfo(title: "Home", icon: Icons.home),
    DrawerButtonsInfo(title: "Contacts", icon: Icons.contact_phone_rounded),
    DrawerButtonsInfo(title: "Riders", icon: Icons.delivery_dining),
    DrawerButtonsInfo(title: "Sellers", icon: Icons.storefront),
    DrawerButtonsInfo(title: "Users", icon: Icons.supervised_user_circle),
    DrawerButtonsInfo(title: "Log out", icon: Icons.logout),
  ];
}
