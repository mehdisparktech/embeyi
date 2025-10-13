import 'package:embeyi/core/component/appbar/common_appbar.dart';
import 'package:embeyi/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:embeyi/core/config/route/job_seeker_routes.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/history_controller.dart';
import '../widgets/history_widgets.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});
  final HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppbar(
        title: 'Jobs History',
        centerTitle: false,
        showBackButton: true,
      ),
      body: Column(
        children: [
          16.height,
          _buildTabBar(),
          16.height,
          Obx(() {
            if (controller.currentTabIndex.value == 2) {
              return Column(
                children: [
                  InterviewFilterButtons(
                    selectedIndex: controller.interviewFilterIndex.value,
                    onFilterChanged: (index) {
                      controller.setInterviewFilter(index);
                    },
                  ),
                  16.height,
                ],
              );
            }
            return const SizedBox.shrink();
          }),
          Expanded(child: _buildTabBarView()),
        ],
      ),
      bottomNavigationBar: const SafeArea(
        child: CommonBottomNavBar(currentIndex: 2, isJobSeeker: true),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Obx(
        () => TabBar(
          controller: controller.tabController,
          isScrollable: true,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          labelPadding: EdgeInsets.symmetric(horizontal: 4.w),
          tabAlignment: TabAlignment.start,
          tabs: [
            Tab(
              child: CustomTabButton(
                title: 'All Jobs',
                isSelected: controller.currentTabIndex.value == 0,
              ),
            ),
            Tab(
              child: CustomTabButton(
                title: 'Rejected Jobs',
                isSelected: controller.currentTabIndex.value == 1,
              ),
            ),
            Tab(
              child: CustomTabButton(
                title: 'Interview',
                isSelected: controller.currentTabIndex.value == 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: controller.tabController,
      children: [
        _buildApplicationList(
          controller.getAllApplications(),
          isInterview: false,
        ),
        _buildApplicationList(
          controller.getRejectedApplications(),
          isInterview: false,
        ),
        Obx(
          () => _buildApplicationList(
            controller.getInterviewApplications(),
            isInterview: true,
          ),
        ),
      ],
    );
  }

  Widget _buildApplicationList(
    List<Map<String, dynamic>> applications, {
    required bool isInterview,
  }) {
    if (applications.isEmpty) {
      return const EmptyHistoryState();
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      itemCount: applications.length,
      itemBuilder: (context, index) {
        final application = applications[index];

        if (isInterview) {
          return InterviewJobCard(
            jobTitle: application['jobTitle'] ?? '',
            companyName: application['companyName'] ?? '',
            location: application['location'] ?? '',
            companyLogo: application['companyLogo'] ?? '',
            interviewDate: application['interviewDate'] ?? '',
            onTap: () {
              Get.toNamed(JobSeekerRoutes.appliedDetails);
            },
          );
        }

        return ApplicationHistoryCard(
          jobTitle: application['jobTitle'] ?? '',
          companyName: application['companyName'] ?? '',
          location: application['location'] ?? '',
          companyLogo: application['companyLogo'] ?? '',
          status: application['status'] ?? '',
          onTap: () {
            Get.toNamed(JobSeekerRoutes.appliedDetails);
          },
        );
      },
    );
  }
}
