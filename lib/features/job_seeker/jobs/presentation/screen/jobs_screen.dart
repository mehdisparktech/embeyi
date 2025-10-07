import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/jobs_controller.dart';

class JobsScreen extends StatelessWidget {
  JobsScreen({super.key});
  final JobsController controller = Get.put(JobsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Job Seeker Jobs')));
  }
}
