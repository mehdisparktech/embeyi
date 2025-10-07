import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/subscription_controller.dart';

class SubscriptionScreen extends StatelessWidget {
  SubscriptionScreen({super.key});
  final SubscriptionController controller = Get.put(SubscriptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Job Seeker Subscription')));
  }
}
