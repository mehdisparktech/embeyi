import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/resume_controller.dart';

class ResumeScreen extends StatelessWidget {
  ResumeScreen({super.key});
  final ResumeController controller = Get.put(ResumeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Job Seeker Resume')));
  }
}
