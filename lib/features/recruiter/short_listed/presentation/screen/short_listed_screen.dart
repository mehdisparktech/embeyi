import 'package:flutter/material.dart';

class ShortListedScreen extends StatelessWidget {
  const ShortListedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Short Listed')),
      body: const Center(child: Text('Short Listed Screen')),
    );
  }
}