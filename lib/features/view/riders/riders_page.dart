import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/detail_page_appbar.dart';
import 'package:fullfill_admin_web_portal/features/view/riders/widgets/blocked_riders.dart';
import 'package:fullfill_admin_web_portal/features/view/riders/widgets/verified_riders.dart';
import 'package:fullfill_admin_web_portal/features/view_model/drawer/select_button_index.dart';

class RidersPage extends StatelessWidget {
  const RidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SelectedProfile>(
      create: (context) => SelectedProfile(),
      builder: (context, child) {
        return const DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: DetailPageAppBar(title: 'Riders'),
            body: TabBarView(
              children: [VerifiedRiders(), BlockedRiders()],
            ),
          ),
        );
      },
    );
  }
}
