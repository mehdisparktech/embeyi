import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class RecruiterHomeScreen extends StatelessWidget {
  RecruiterHomeScreen({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Recruiter Home')));
  }
}
