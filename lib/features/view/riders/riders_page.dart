import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/view_model/riders/riders_provider.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/profile_container.dart';
import 'package:provider/provider.dart';

class RidersPage extends StatelessWidget {
  const RidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final riders =
        Provider.of<RiderProvider>(context, listen: false).verifiedRiders[0];

    return Scaffold(
      appBar: AppBar(
        title: const Text('RidersPage'),
      ),
      body: Center(
        child: ProfileContainer(
          user: riders,
        ),
      ),
    );
  }
}
