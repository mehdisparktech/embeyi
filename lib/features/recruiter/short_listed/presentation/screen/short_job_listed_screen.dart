import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/short_job_listed_controller.dart';
import '../../../home/presentation/widgets/shortlisted_candidate_card.dart';

class ShortJobListedScreen extends StatelessWidget {
  const ShortJobListedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShortJobListedController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: _buildCandidatesList(controller),
        ),
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
      title: CommonText(
        text: 'Short Listed',
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      centerTitle: true,
    );
  }

  Widget _buildCandidatesList(ShortJobListedController controller) {
    return Obx(
      () => controller.shortlistedCandidates.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.shortlistedCandidates.length,
              itemBuilder: (context, index) {
                final candidate = controller.shortlistedCandidates[index];
                return ShortlistedCandidateCard(
                  name: candidate['name'],
                  jobTitle: candidate['jobTitle'],
                  experience: candidate['experience'],
                  description: candidate['description'],
                  profileImage: candidate['profileImage'],
                  onTap: () =>
                      controller.viewCandidateProfile(candidate['name']),
                  onDelete: () => controller.deleteCandidate(index),
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
          'No shortlisted candidates',
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
