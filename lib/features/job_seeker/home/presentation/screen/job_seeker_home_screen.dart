import 'package:embeyi/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class JobSeekerHomeScreen extends StatelessWidget {
  JobSeekerHomeScreen({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Job Seeker Home')),
      bottomNavigationBar: const CommonBottomNavBar(
        currentIndex: 0,
        isJobSeeker: true,
      ),
    );
  }
}
