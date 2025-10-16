import 'package:embeyi/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/post_insight_controller.dart';
import '../widgets/insight_stat_card.dart';
import '../widgets/recent_applicant_card.dart';

class PostInsightScreen extends StatelessWidget {
  const PostInsightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostInsightController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDropdowns(controller),
              16.height,
              _buildStatsGrid(controller),
              24.height,
              _buildRecentApplicants(controller),
              24.height,
              _buildRecentQualified(controller),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const SafeArea(
        child: CommonBottomNavBar(currentIndex: 1),
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
        'Post Insights',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
        ),
      ),
      centerTitle: false,
    );
  }

  Widget _buildDropdowns(PostInsightController controller) {
    return Row(
      children: [
        Expanded(
          child: Obx(
            () => _buildDropdown(
              value: controller.selectedJobTitle.value,
              items: controller.jobTitles,
              onChanged: controller.selectJobTitle,
            ),
          ),
        ),
        12.width,
        Expanded(
          child: Obx(
            () => _buildDropdown(
              value: controller.selectedTimePeriod.value,
              items: controller.timePeriods,
              onChanged: controller.selectTimePeriod,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required Function(String) onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.borderColor, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.black,
            size: 20.sp,
          ),
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) onChanged(newValue);
          },
        ),
      ),
    );
  }

  Widget _buildStatsGrid(PostInsightController controller) {
    return Obx(
      () => GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 1.4,
        children: [
          InsightStatCard(
            label: 'Application',
            value: controller.applicationCount.value.toString(),
            valueColor: AppColors.secondaryPrimary,
          ),
          InsightStatCard(
            label: 'Qualified',
            value: controller.qualifiedCount.value.toString(),
            valueColor: const Color(0xFF008F37),
          ),
          InsightStatCard(
            label: 'Engagement',
            value: controller.engagementRate.value,
            valueColor: const Color(0xFF2196F3),
          ),
          InsightStatCard(
            label: 'Reject',
            value: controller.rejectCount.value.toString(),
            valueColor: AppColors.error,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentApplicants(PostInsightController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Applicant',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        12.height,
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.recentApplicants.length,
            itemBuilder: (context, index) {
              final applicant = controller.recentApplicants[index];
              return RecentApplicantCard(
                name: applicant['name'],
                jobTitle: applicant['jobTitle'],
                matchPercentage: applicant['matchPercentage'],
                profileImage: applicant['profileImage'],
                onTap: () => controller.viewApplicantProfile(applicant['name']),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecentQualified(PostInsightController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Qualified',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        12.height,
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.recentQualified.length,
            itemBuilder: (context, index) {
              final qualified = controller.recentQualified[index];
              return RecentApplicantCard(
                name: qualified['name'],
                jobTitle: qualified['jobTitle'],
                matchPercentage: qualified['matchPercentage'],
                profileImage: qualified['profileImage'],
                onTap: () => controller.viewApplicantProfile(qualified['name']),
              );
            },
          ),
        ),
      ],
    );
  }
}
