import 'package:flutter/material.dart';

class PendingRequestScreen extends StatelessWidget {
  const PendingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pending Request')),
      body: const Center(child: Text('Pending Request Screen')),
    );
  }
}