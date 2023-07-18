import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/detail_page_appbar.dart';
import 'package:fullfill_admin_web_portal/features/view/sellers/widgets/blocked_sellers.dart';
import 'package:fullfill_admin_web_portal/features/view_model/drawer/select_button_index.dart';
import 'package:fullfill_admin_web_portal/features/view/sellers/widgets/verified_sellers.dart';

class SellersPage extends StatelessWidget {
  const SellersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SelectedProfile>(
      create: (context) => SelectedProfile(),
      builder: (context, child) {
        return const DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: DetailPageAppBar(title: 'SELLERS'),
            body: TabBarView(
              children: [VerifiedSellers(), BlockedSellers()],
            ),
          ),
        );
      },
    );
  }
}
