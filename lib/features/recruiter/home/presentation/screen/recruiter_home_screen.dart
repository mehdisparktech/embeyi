import 'package:embeyi/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class RecruiterHomeScreen extends StatelessWidget {
  RecruiterHomeScreen({super.key});
  final RecruiterHomeController controller = Get.put(RecruiterHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Recruiter Home')),
      bottomNavigationBar: SafeArea(
        child: const CommonBottomNavBar(currentIndex: 0),
      ),
    );
  }
}
