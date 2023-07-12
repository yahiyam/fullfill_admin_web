import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContactsPage'),
      ),
      body: const Center(
        child: Text('ContactsPage scaffold'),
      ),
    );
  }
}
