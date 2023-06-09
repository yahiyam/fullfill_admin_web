import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class AllBlockedSellersScreen extends StatelessWidget {
  const AllBlockedSellersScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Widget displayBlockedSellersDesign() {
      return const Center(
        child: Text(
          "No Record Found.",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: const SimpleAppBar(
        title: "All Blocked Sellers Accounts",
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: displayBlockedSellersDesign(),
        ),
      ),
    );
  }
}
