import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UsersPage'),
      ),
      body: const Center(
        child: Text('UsersPage scaffold'),
      ),
    );
  }
}
