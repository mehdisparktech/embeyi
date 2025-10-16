import 'package:embeyi/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:embeyi/core/config/route/app_routes.dart';
import 'package:embeyi/core/config/route/recruiter_routes.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'controller/home_controller.dart';
import 'widgets/stat_card.dart';
import 'widgets/recruiter_job_card.dart';

class RecruiterHomeScreen extends StatelessWidget {
  RecruiterHomeScreen({super.key});
  final RecruiterHomeController controller = Get.put(RecruiterHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    _buildStatsGrid(),
                    24.height,
                    _buildRecentJobsSection(),
                    16.height,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SafeArea(
        child: CommonBottomNavBar(currentIndex: 0),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      color: Colors.white,
      child: Row(
        children: [
          // Logo
          Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: AppColors.secondaryPrimary,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.work_outline, color: Colors.white, size: 20.sp),
          ),
          8.width,
          // Company Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jobarman',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                2.height,
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 12.sp,
                      color: AppColors.secondaryText,
                    ),
                    4.width,
                    Text(
                      '2118 Thornridge Cir. Syracuse',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Action Icons
          _buildActionIcon(Icons.chat_bubble_outline, hasNotification: false),
          8.width,
          _buildActionIcon(Icons.notifications_outlined, hasNotification: true),
        ],
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, {required bool hasNotification}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 20.sp),
        ),
        if (hasNotification)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 10.w,
              height: 10.h,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12.h,
      crossAxisSpacing: 12.w,
      childAspectRatio: 1.4,
      children: [
        StatCard(
          count: '05',
          label: 'Active Jobs',
          backgroundColor: AppColors.primaryColor,
          onTap: () {
            AppRoutes.goToActiveJobPost();
          },
        ),
        StatCard(
          count: '20',
          label: 'Pending Request',
          backgroundColor: const Color(0xFF3AAFB9),
          onTap: () {
            AppRoutes.goToPendingJobRequest();
          },
        ),
        StatCard(
          count: '20',
          label: 'Short Listed',
          backgroundColor: const Color(0xFF008F37),
          onTap: () {
            AppRoutes.goToShortJobListed();
          },
        ),
        StatCard(
          count: '10',
          label: 'Interview',
          backgroundColor: AppColors.secondaryPrimary,
          onTap: () {
            AppRoutes.goToInterviewJob();
          },
        ),
      ],
    );
  }

  Widget _buildRecentJobsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Job Post',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            Row(
              children: [
                Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                4.width,
                Icon(
                  Icons.arrow_forward,
                  size: 16.sp,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ],
        ),
        16.height,
        _buildJobsList(),
      ],
    );
  }

  Widget _buildJobsList() {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.recentJobs.length,
        itemBuilder: (context, index) {
          final job = controller.recentJobs[index];
          return RecruiterJobCard(
            jobTitle: job['title']!,
            location: job['location']!,
            isFullTime: job['isFullTime'] as bool,
            isRemote: job['isRemote'] as bool,
            candidateCount: job['candidateCount'] as int,
            deadline: job['deadline']!,
            thumbnailImage: job['thumbnail']!,
            onTap: () {
              RecruiterRoutes.goToJobDetails();
            },
          );
        },
      ),
    );
  }
}
