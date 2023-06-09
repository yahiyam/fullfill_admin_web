import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class AllBlockedUsersScreen extends StatelessWidget {
  const AllBlockedUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget displayNonVerifiedUsersDesign() {
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
        title: "All Blocked Users Accounts",
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: displayNonVerifiedUsersDesign(),
        ),
      ),
    );
  }
}
