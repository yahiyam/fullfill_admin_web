import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class AllBlockedRidersScreen extends StatelessWidget {
  const AllBlockedRidersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget displayBlockedRidersDesign() {
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
        title: "All Blocked Riders Accounts",
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: displayBlockedRidersDesign(),
        ),
      ),
    );
  }
}
