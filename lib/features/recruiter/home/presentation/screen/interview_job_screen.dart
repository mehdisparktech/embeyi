import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/interview_job_controller.dart';
import '../widgets/date_selector.dart';
import '../widgets/interview_candidate_card.dart';

class InterviewJobScreen extends StatelessWidget {
  const InterviewJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InterviewJobController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildTabBar(controller),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMonthLabel(controller),
                    12.height,
                    _buildDateSelector(controller),
                    16.height,
                    _buildTodayLabel(),
                    12.height,
                    _buildInterviewsList(controller),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: AppColors.black, size: 24.sp),
        onPressed: () => Get.back(),
      ),
      title: Text(
        'Interview',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
        ),
      ),
      centerTitle: false,
    );
  }

  Widget _buildTabBar(InterviewJobController controller) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: _buildTabButton(
                label: 'Upcoming',
                isSelected: controller.selectedTabIndex.value == 0,
                onTap: () => controller.selectTab(0),
              ),
            ),
            12.width,
            Expanded(
              child: _buildTabButton(
                label: 'Complete',
                isSelected: controller.selectedTabIndex.value == 1,
                onTap: () => controller.selectTab(1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.borderColor,
            width: 1,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.secondaryText,
          ),
        ),
      ),
    );
  }

  Widget _buildMonthLabel(InterviewJobController controller) {
    return Obx(
      () => Row(
        children: [
          Text(
            controller.selectedMonth.value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          4.width,
          Icon(Icons.keyboard_arrow_down, size: 20.sp, color: AppColors.black),
        ],
      ),
    );
  }

  Widget _buildDateSelector(InterviewJobController controller) {
    return Obx(
      () => DateSelector(
        dates: controller.dates,
        selectedIndex: controller.selectedDateIndex.value,
        onDateSelected: controller.selectDate,
      ),
    );
  }

  Widget _buildTodayLabel() {
    return Text(
      'Today',
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ),
    );
  }

  Widget _buildInterviewsList(InterviewJobController controller) {
    return Obx(
      () => controller.currentInterviews.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.currentInterviews.length,
              itemBuilder: (context, index) {
                final interview = controller.currentInterviews[index];
                return InterviewCandidateCard(
                  name: interview['name'],
                  jobTitle: interview['jobTitle'],
                  experience: interview['experience'],
                  scheduleTime: interview['scheduleTime'],
                  profileImage: interview['profileImage'],
                  onTap: () =>
                      controller.viewCandidateProfile(interview['name']),
                  onEdit: () => controller.editInterview(interview['name']),
                );
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: Text(
          'No interviews scheduled',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.secondaryText,
          ),
        ),
      ),
    );
  }
}
