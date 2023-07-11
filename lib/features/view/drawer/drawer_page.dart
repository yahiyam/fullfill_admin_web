import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/features/view_model/drawer/drawer_buttons.dart';
import 'package:fullfill_admin_web_portal/features/view_model/drawer/select_button_index.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: KColors.drawerBgColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.smallPadding * 4),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  if (!ResponsiveLayout.isComputer())
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
              const SizedBox(height: KSizes.padding),
              ...List.generate(
                DrawerInfo.drawerButtons.length,
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
                              DrawerInfo.drawerButtons[index].title,
                              style: const TextStyle(
                                color: KColors.neutralColor,
                              ),
                            ),
                            leading: Padding(
                              padding:
                                  const EdgeInsets.all(KSizes.smallPadding),
                              child: Icon(
                                DrawerInfo.drawerButtons[index].icon,
                                color: KColors.neutralColor,
                              ),
                            ),
                            splashColor: KColors.primary,
                            onTap: () {
                              selectButton.selectIndex(index);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        );
                      },
                    ),
                    if (index != DrawerInfo.drawerButtons.length - 1)
                      const Divider(
                        color: KColors.neutralColor,
                        thickness: 0.1,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
