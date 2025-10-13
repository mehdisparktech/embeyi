import 'package:embeyi/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/history_controller.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});
  final HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Job Seeker History')),
      bottomNavigationBar: SafeArea(
        child: const CommonBottomNavBar(currentIndex: 2, isJobSeeker: true),
      ),
    );
  }
}
