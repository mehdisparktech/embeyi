import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/utils/constants/app_icons.dart';
import 'package:embeyi/features/recruiter/job_post/presentation/controller/create_job_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:embeyi/core/component/appbar/common_appbar.dart';
import 'package:embeyi/core/component/button/common_button.dart';
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/component/text_field/common_text_field.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';

class RecruiterCreateJobPostScreen extends StatelessWidget {
  const RecruiterCreateJobPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecruiterCreateJobPostController());

    return Scaffold(
      appBar: CommonAppbar(
        title: 'EDIT POST',
        showLeading: true,
        centerTitle: true,
        textColor: AppColors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),

                      // Profile Image Upload Section
                      _buildProfileImageSection(controller),

                      SizedBox(height: 24.h),

                      // Job Title
                      _buildLabel('Job Title'),
                      SizedBox(height: 8.h),
                      CommonTextField(
                        controller: controller.jobTitleController,
                        hintText: 'Enter job title',
                        fillColor: AppColors.white,
                        borderColor: AppColors.borderColor,
                      ),

                      SizedBox(height: 16.h),

                      // Job Category
                      _buildLabel('Job Category'),
                      SizedBox(height: 8.h),
                      Obx(
                        () => _buildDropdown(
                          value: controller.selectedJobCategory.value,
                          items: controller.jobCategories,
                          onChanged: controller.updateJobCategory,
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Employment Type
                      _buildLabel('Employment Type'),
                      SizedBox(height: 8.h),
                      Obx(
                        () => _buildDropdown(
                          value: controller.selectedEmploymentType.value,
                          items: controller.employmentTypes,
                          onChanged: controller.updateEmploymentType,
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Job Type
                      _buildLabel('Job Type'),
                      SizedBox(height: 8.h),
                      Obx(
                        () => _buildDropdown(
                          value: controller.selectedJobType.value,
                          items: controller.jobTypes,
                          onChanged: controller.updateJobType,
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Experience Level
                      _buildLabel('Experience Level'),
                      SizedBox(height: 8.h),
                      Obx(
                        () => _buildDropdown(
                          value: controller.selectedExperienceLevel.value,
                          items: controller.experienceLevels,
                          onChanged: controller.updateExperienceLevel,
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Salary Range
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLabel('Min Salary'),
                                SizedBox(height: 8.h),
                                CommonTextField(
                                  controller: controller.minSalaryController,
                                  hintText: 'Min Salary',
                                  keyboardType: TextInputType.number,
                                  fillColor: AppColors.white,
                                  borderColor: AppColors.borderColor,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLabel('Max Salary'),
                                SizedBox(height: 8.h),
                                CommonTextField(
                                  controller: controller.maxSalaryController,
                                  hintText: 'Max Salary',
                                  keyboardType: TextInputType.number,
                                  fillColor: AppColors.white,
                                  borderColor: AppColors.borderColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16.h),

                      // Job Location
                      _buildLabel('Job Location'),
                      SizedBox(height: 8.h),
                      CommonTextField(
                        controller: controller.jobLocationController,
                        hintText: 'Enter job location',
                        fillColor: AppColors.white,
                        borderColor: AppColors.borderColor,
                      ),

                      SizedBox(height: 16.h),

                      // Company Description
                      _buildLabel('Company Description'),
                      SizedBox(height: 8.h),
                      CommonTextField(
                        controller: controller.companyDescriptionController,
                        hintText: 'Enter company description',
                        maxLines: 5,
                        textInputAction: TextInputAction.newline,
                        fillColor: AppColors.white,
                        borderColor: AppColors.borderColor,
                      ),

                      SizedBox(height: 16.h),

                      // Key Responsibilities
                      _buildLabel('Key Responsibilities'),
                      SizedBox(height: 8.h),
                      CommonTextField(
                        controller: controller.keyResponsibilitiesController,
                        hintText: 'Enter key responsibilities',
                        maxLines: 5,
                        textInputAction: TextInputAction.newline,
                        fillColor: AppColors.white,
                        borderColor: AppColors.borderColor,
                      ),

                      SizedBox(height: 16.h),

                      // Requirements
                      _buildLabel('Requirements'),
                      SizedBox(height: 8.h),
                      CommonTextField(
                        controller: controller.requirementsController,
                        hintText: 'Enter requirements',
                        maxLines: 5,
                        textInputAction: TextInputAction.newline,
                        fillColor: AppColors.white,
                        borderColor: AppColors.borderColor,
                      ),

                      SizedBox(height: 16.h),

                      // Working Hours
                      _buildLabel('Working Hours'),
                      SizedBox(height: 8.h),
                      CommonTextField(
                        controller: controller.workingHoursController,
                        hintText: 'Enter working hours',
                        fillColor: AppColors.white,
                        borderColor: AppColors.borderColor,
                      ),

                      SizedBox(height: 16.h),

                      // How To Apply
                      _buildLabel('How To Apply'),
                      SizedBox(height: 8.h),
                      CommonTextField(
                        controller: controller.howToApplyController,
                        hintText: 'Enter application instructions',
                        maxLines: 3,
                        textInputAction: TextInputAction.newline,
                        fillColor: AppColors.white,
                        borderColor: AppColors.borderColor,
                      ),

                      SizedBox(height: 16.h),

                      // Application Deadline
                      _buildLabel('Application Deadline'),
                      SizedBox(height: 8.h),
                      CommonTextField(
                        controller: controller.applicationDeadlineController,
                        hintText: 'Select deadline',
                        readOnly: true,
                        fillColor: AppColors.white,
                        borderColor: AppColors.borderColor,
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          size: 18.sp,
                          color: AppColors.textFiledColor,
                        ),
                        onTap: controller.selectDeadlineDate,
                      ),

                      SizedBox(height: 16.h),

                      // S&S Required
                      _buildLabel('S&S Required'),
                      SizedBox(height: 8.h),
                      Obx(
                        () => _buildDropdown(
                          value: controller.selectedSSSRequired.value,
                          items: controller.sssRequiredOptions,
                          onChanged: controller.updateSSSRequired,
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // Skills Tags Section
                      Obx(
                        () => Wrap(
                          spacing: 8.w,
                          runSpacing: 8.h,
                          children: [
                            ...controller.skills.map(
                              (skill) => _buildSkillChip(skill, controller),
                            ),
                            _buildAddSkillButton(controller),
                          ],
                        ),
                      ),

                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ),

            // Submit Button
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: CommonButton(
                titleText: 'Submit',
                titleSize: 16,
                titleWeight: FontWeight.w600,
                buttonHeight: 50.h,
                buttonRadius: 8,
                buttonColor: AppColors.primaryColor,
                isGradient: false,
                onTap: controller.submitJobPost,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImageSection(
    RecruiterCreateJobPostController controller,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0xFF123499)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: controller.pickProfileImage,
              child: Obx(
                () => controller.profileImagePath.value != null
                    ? CommonImage(
                        imageSrc: controller.profileImagePath.value!,
                        size: 40.sp,
                      )
                    : CommonImage(imageSrc: AppIcons.upload2, size: 40.sp),
              ),
            ),
            SizedBox(height: 8.h),
            CommonText(
              text: 'Upload/Cover Image',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return CommonText(
      text: text,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
      textAlign: TextAlign.start,
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
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4.r),
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
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryText,
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

  Widget _buildSkillChip(
    String skill,
    RecruiterCreateJobPostController controller,
  ) {
    // Different colors for different skills
    Color chipColor;
    Color textColor;

    switch (skill) {
      case 'Figma':
        chipColor = const Color(0xFFE8E8F5);
        textColor = const Color(0xFF123499);
        break;
      case 'UI Design':
        chipColor = const Color(0xFFFFE8F5);
        textColor = const Color(0xFFCC0066);
        break;
      case 'Website Design':
        chipColor = const Color(0xFFFFF4E8);
        textColor = const Color(0xFFFF8F27);
        break;
      case 'Recruiting':
        chipColor = const Color(0xFFE8F5ED);
        textColor = const Color(0xFF008F37);
        break;
      default:
        chipColor = const Color(0xFFE8E8F5);
        textColor = const Color(0xFF123499);
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonText(
            text: skill,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          SizedBox(width: 6.w),
          GestureDetector(
            onTap: () => controller.removeSkill(skill),
            child: Icon(Icons.close, size: 16.sp, color: textColor),
          ),
        ],
      ),
    );
  }

  Widget _buildAddSkillButton(RecruiterCreateJobPostController controller) {
    return GestureDetector(
      onTap: controller.showAddSkillDialog,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.borderColor, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, size: 16.sp, color: AppColors.primaryText),
            SizedBox(width: 4.w),
            CommonText(
              text: 'Add Skill',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryText,
            ),
          ],
        ),
      ),
    );
  }
}
