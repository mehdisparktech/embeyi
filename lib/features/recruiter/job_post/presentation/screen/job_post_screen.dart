import 'package:flutter/material.dart';

class JobPostScreen extends StatelessWidget {
  const JobPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job Post')),
      body: const Center(child: Text('Job Post Screen')),
    );
  }
}