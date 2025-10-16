import 'package:embeyi/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:flutter/material.dart';

class JobPostScreen extends StatelessWidget {
  const JobPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job Post')),
      body: const Center(child: Text('Job Post Screen')),
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 2),
    );
  }
}
