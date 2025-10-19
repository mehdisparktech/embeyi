import 'package:embeyi/core/config/route/recruiter_routes.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/job_card_details_controller.dart';
import '../widgets/candidate_card.dart';
import '../widgets/filter_chip_button.dart';
import '../widgets/job_detail_header_card.dart';

class JobCardDetailsScreen extends StatelessWidget {
  const JobCardDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(JobCardDetailsController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildJobDetailHeader(controller),
              16.height,
              _buildFilterChips(controller),
              16.height,
              _buildCandidatesList(controller),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: AppColors.black, size: 24.sp),
        onPressed: () => Get.back(),
      ),
      title: Text(
        'Sr. UI/UX Designer',
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildJobDetailHeader(JobCardDetailsController controller) {
    return Obx(
      () => JobDetailHeaderCard(
        jobTitle: controller.jobTitle.value,
        location: controller.location.value,
        isRemote: controller.isRemote.value,
        candidateCount: controller.candidateCount.value,
        deadline: controller.deadline.value,
        thumbnailImage: AppImages.jobPost,
        isSaved: controller.isSaved.value,
        onSave: controller.toggleSave,
        onViewPost: () {
          RecruiterRoutes.goToViewJobPost();
        },
        onRePost: controller.rePost,
        onClosePost: controller.closePost,
      ),
    );
  }

  Widget _buildFilterChips(JobCardDetailsController controller) {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: controller.filters.map((filter) {
            return Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: FilterChipButton(
                label: filter,
                isSelected: controller.selectedFilter.value == filter,
                onTap: () => controller.selectFilter(filter),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCandidatesList(JobCardDetailsController controller) {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.filteredCandidates.length,
        itemBuilder: (context, index) {
          final candidate = controller.filteredCandidates[index];
          return CandidateCard(
            name: candidate['name'],
            jobTitle: candidate['jobTitle'],
            experience: candidate['experience'],
            description: candidate['description'],
            matchPercentage: candidate['matchPercentage'],
            profileImage: candidate['profileImage'],
            onTap: () => controller.viewCandidateProfile(candidate['name']),
          );
        },
      ),
    );
  }
}
