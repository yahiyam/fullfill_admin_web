import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/detail_page_appbar.dart';
import 'package:provider/provider.dart';
import 'package:fullfill_admin_web_portal/features/view/users/widgets/blocked_users.dart';
import 'package:fullfill_admin_web_portal/features/view/users/widgets/verified_users.dart';
import 'package:fullfill_admin_web_portal/features/view_model/drawer/select_button_index.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SelectedProfile>(
      create: (context) => SelectedProfile(),
      builder: (context, child) {
        return const DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: DetailPageAppBar(title: 'USERS'),
            body: TabBarView(
              children: [VerifiedUsers(), BlockedUsers()],
            ),
          ),
        );
      },
    );
  }
}
