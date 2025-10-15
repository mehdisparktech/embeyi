import 'package:embeyi/core/component/button/common_button.dart';
import 'package:embeyi/core/component/text_field/common_text_field.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/component/text/common_text.dart';

// ... existing code ...
class AddWorkExperienceScreen extends StatelessWidget {
  const AddWorkExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: CommonText(
          text: 'Add Work Experience',
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
          color: AppColors.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                CommonText(
                  text: 'Job Title',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.black,
                ),
                CommonTextField(
                  labelText: 'Job Title',
                  controller: TextEditingController(),
                ),
                SizedBox(height: 16.h),
                CommonText(
                  text: 'Company Name',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.black,
                ),
                CommonTextField(
                  labelText: 'Company Name',
                  controller: TextEditingController(),
                ),
                SizedBox(height: 16.h),
                CommonText(
                  text: 'Design Hill',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.black,
                ),
                CommonTextField(
                  labelText: 'Design Hill',
                  controller: TextEditingController(),
                ),
                SizedBox(height: 16.h),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: 'Start Date',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: AppColors.black,
                          ),
                          CommonTextField(labelText: 'Start Date'),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: 'End Date',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: AppColors.black,
                          ),
                          CommonTextField(labelText: 'End Date'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                CommonText(
                  text: 'Location',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.black,
                ),
                CommonTextField(labelText: 'Location'),
                SizedBox(height: 16.h),
                CommonText(
                  text: 'Description',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.black,
                ),
                CommonTextField(labelText: 'Description', maxLines: 5),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                      activeColor: AppColors.primary,
                    ),
                    CommonText(
                      text: 'I Currently Work This Company',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: AppColors.secondaryText,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.center,
                  child: CommonButton(
                    titleText: 'Add',
                    titleSize: 16.sp,
                    titleWeight: FontWeight.w600,
                    buttonHeight: 52.h,
                    buttonRadius: 12.r,
                    onTap: () {
                      // Handle update work experience
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
