import 'package:embeyi/core/component/button/common_button.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/active_job_post_controller.dart';
import '../widgets/recruiter_job_card.dart';

class ActiveJobPostScreen extends StatelessWidget {
  const ActiveJobPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ActiveJobPostController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: _buildJobsList(controller),
              ),
            ),
          ),
          _buildCreateJobButton(controller),
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
        'Active Job Post',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
        ),
      ),
      centerTitle: false,
    );
  }

  Widget _buildJobsList(ActiveJobPostController controller) {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.activeJobs.length,
        itemBuilder: (context, index) {
          final job = controller.activeJobs[index];
          return RecruiterJobCard(
            jobTitle: job['title']!,
            location: job['location']!,
            isFullTime: job['isFullTime'] as bool,
            isRemote: job['isRemote'] as bool,
            candidateCount: job['candidateCount'] as int,
            deadline: job['deadline']!,
            thumbnailImage: job['thumbnail']!,
            onTap: () => controller.viewJobDetails(job['title']!),
          );
        },
      ),
    );
  }

  Widget _buildCreateJobButton(ActiveJobPostController controller) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: CommonButton(
          titleText: 'Create New Job Post',
          buttonHeight: 50.h,
          buttonRadius: 8.r,
          titleSize: 16.sp,
          titleWeight: FontWeight.w700,
          onTap: controller.createNewJobPost,
        ),
      ),
    );
  }
}
