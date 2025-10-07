import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/history_controller.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key}) : super(key: key);
  final HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Job Seeker History')),
    );
  }
}