import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/view/home/widgets/custom_app_bar.dart';
import 'package:fullfill_admin_web_portal/responsive/responsive_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: (ResponsiveLayout.isSmartwatch()) ? Container() : AppBarWidget(),
      ),
    );
  }
}
