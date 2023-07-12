import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/features/view_model/sellers/sellers_provider.dart';
import 'package:fullfill_admin_web_portal/utils/widgets/profile_container.dart';
import 'package:provider/provider.dart';

class SellersPage extends StatelessWidget {
  const SellersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final seller =
        Provider.of<SellerProvider>(context, listen: false).verifiedSellers[0];

    return Scaffold(
      appBar: AppBar(
        title: const Text('SellersPage'),
      ),
      body: Center(
        child: ProfileContainer(
          user: seller,
        ),
      ),
    );
  }
}
