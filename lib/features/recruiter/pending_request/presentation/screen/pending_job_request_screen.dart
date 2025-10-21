import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/pending_job_request_controller.dart';
import '../../../home/presentation/widgets/candidate_card.dart';

class PendingJobRequestScreen extends StatelessWidget {
  const PendingJobRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PendingJobRequestController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(controller),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildJobTitleDropdown(controller),
              16.height,
              _buildCandidatesList(controller),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(PendingJobRequestController controller) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: AppColors.black, size: 24.sp),
        onPressed: () => Get.back(),
      ),
      title: Obx(
        () => Text(
          'Request (${controller.totalRequestCount})',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildJobTitleDropdown(PendingJobRequestController controller) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.borderColor, width: 1),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: controller.selectedJobTitle.value,
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.black,
              size: 20.sp,
            ),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            items: controller.jobTitles.map((String jobTitle) {
              return DropdownMenuItem<String>(
                value: jobTitle,
                child: Text(jobTitle),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                controller.selectJobTitle(newValue);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCandidatesList(PendingJobRequestController controller) {
    return Obx(
      () => controller.filteredRequests.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.filteredRequests.length,
              itemBuilder: (context, index) {
                final candidate = controller.filteredRequests[index];
                return CandidateCard(
                  name: candidate['name'],
                  jobTitle: candidate['jobTitle'],
                  experience: candidate['experience'],
                  description: candidate['description'],
                  matchPercentage: candidate['matchPercentage'],
                  profileImage: candidate['profileImage'],
                  onTap: () =>
                      controller.viewCandidateProfile(candidate['name']),
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
          'No pending requests for this position',
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
