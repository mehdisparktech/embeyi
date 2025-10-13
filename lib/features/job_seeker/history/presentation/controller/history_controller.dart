import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxInt currentTabIndex = 0.obs;
  RxInt interviewFilterIndex = 0.obs; // 0 = Upcoming, 1 = Complete

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      currentTabIndex.value = tabController.index;
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void setInterviewFilter(int index) {
    interviewFilterIndex.value = index;
  }

  List<Map<String, dynamic>> getAllApplications() {
    return [
      {
        'jobTitle': 'Sr. UI/UX Designer',
        'companyName': 'Design-Hill',
        'location': 'California, United State.',
        'companyLogo': 'assets/images/job_post.png',
        'status': 'Applied',
      },
      {
        'jobTitle': 'Product Designer',
        'companyName': 'Design-Hill',
        'location': 'California, United State.',
        'companyLogo': 'assets/images/job_post.png',
        'status': 'Interview',
        'interviewDate': 'Today',
        'isUpcoming': true,
      },
      {
        'jobTitle': 'Product Designer',
        'companyName': 'Design-Hill',
        'location': 'California, United State.',
        'companyLogo': 'assets/images/job_post.png',
        'status': 'Interview',
        'interviewDate': 'Tomorrow',
        'isUpcoming': true,
      },
      {
        'jobTitle': 'Product Designer',
        'companyName': 'Design-Hill',
        'location': 'California, United State.',
        'companyLogo': 'assets/images/job_post.png',
        'status': 'Interview',
        'interviewDate': '5 Sep 25',
        'isUpcoming': true,
      },
      {
        'jobTitle': 'Product Designer',
        'companyName': 'Design-Hill',
        'location': 'California, United State.',
        'companyLogo': 'assets/images/job_post.png',
        'status': 'Interview',
        'interviewDate': '5 Sep 25',
        'isUpcoming': true,
      },
      {
        'jobTitle': 'Product Designer',
        'companyName': 'Design-Hill',
        'location': 'California, United State.',
        'companyLogo': 'assets/images/job_post.png',
        'status': 'Interview',
        'interviewDate': '5 Sep 25',
        'isUpcoming': true,
      },
      {
        'jobTitle': 'UI/UX Designer',
        'companyName': 'Design-Hill',
        'location': 'California, United State.',
        'companyLogo': 'assets/images/job_post.png',
        'status': 'Rejected',
      },
      {
        'jobTitle': 'Jr. UI/UX Designer',
        'companyName': 'Design-Hill',
        'location': 'California, United State.',
        'companyLogo': 'assets/images/job_post.png',
        'status': 'Interview',
        'interviewDate': '1 Sep 25',
        'isUpcoming': false,
      },
    ];
  }

  List<Map<String, dynamic>> getRejectedApplications() {
    return getAllApplications()
        .where((app) => app['status'] == 'Rejected')
        .toList();
  }

  List<Map<String, dynamic>> getInterviewApplications() {
    final interviews = getAllApplications()
        .where((app) => app['status'] == 'Interview')
        .toList();

    if (interviewFilterIndex.value == 0) {
      // Upcoming interviews
      return interviews.where((app) => app['isUpcoming'] == true).toList();
    } else {
      // Completed interviews
      return interviews.where((app) => app['isUpcoming'] == false).toList();
    }
  }
}
