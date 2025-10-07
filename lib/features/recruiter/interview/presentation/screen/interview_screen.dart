import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/interview_controller.dart';

class InterviewScreen extends StatelessWidget {
  InterviewScreen({super.key});
  final InterviewController controller = Get.put(InterviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Recruiter Interviews')));
  }
}
