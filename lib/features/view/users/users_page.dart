import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/view_model/users/users_provider.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/profile_container.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user =
        Provider.of<UserProvider>(context, listen: false).verifiedUsers[0];

    return Scaffold(
      appBar: AppBar(
        title: const Text('UsersPage'),
      ),
      body: Center(
        child: ProfileContainer(
          user: user,
        ),
      ),
    );
  }
}
