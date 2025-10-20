import 'package:embeyi/core/component/appbar/common_appbar.dart';
import 'package:embeyi/core/component/button/common_button.dart';
import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/component/pop_up/interview_schedule_popup.dart';
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/component/text_field/common_text_field.dart';
import 'package:embeyi/core/config/route/recruiter_routes.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_icons.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResumeScreen extends StatelessWidget {
  final bool isShortlist;
  final bool isInterview;
  final bool isReject;
  const ResumeScreen({
    super.key,
    this.isShortlist = true,
    this.isInterview = true,
    this.isReject = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppbar(
        title: 'View Resume',
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: IconButton(
              onPressed: () {},
              icon: CommonImage(
                imageSrc: AppIcons.download,
                width: 20.w,
                height: 20.h,
              ),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.success,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.all(0.r),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [CommonImage(imageSrc: AppImages.resumeImage)],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 10.w,
                children: [
                  if (isShortlist)
                    Expanded(
                      child: CommonButton(
                        titleText: 'Shortlist',
                        buttonColor: AppColors.secondaryPrimary,
                        borderColor: AppColors.secondaryPrimary,
                        isGradient: false,
                        onTap: () {},
                        buttonHeight: 38.h,
                        titleColor: AppColors.white,
                        titleSize: 12.sp,
                      ),
                    ),
                  Expanded(
                    child: CommonButton(
                      titleText: 'Interview',
                      buttonColor: AppColors.success,
                      borderColor: AppColors.success,
                      isGradient: false,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => InterviewSchedulePopup(),
                        );
                      },
                      buttonHeight: 38.h,
                      titleColor: AppColors.white,
                      titleSize: 12.sp,
                    ),
                  ),
                  Expanded(
                    child: CommonButton(
                      titleText: 'Reject',
                      buttonColor: AppColors.red,
                      borderColor: AppColors.red,
                      isGradient: false,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: AppColors.white,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            title: CommonText(text: 'Rejected Reason'),
                            content: CommonTextField(
                              controller: TextEditingController(),
                              labelText: 'Rejected Reason',
                              maxLines: 5,
                              paddingHorizontal: 10.w,
                              paddingVertical: 10.h,
                            ),
                            actions: [
                              CommonButton(
                                titleText: 'Submit',
                                onTap: () {
                                  Get.back();
                                },
                                buttonHeight: 42.h,
                                titleColor: AppColors.white,
                                titleSize: 14.sp,
                              ),
                            ],
                          ),
                        );
                      },
                      buttonHeight: 38.h,
                      titleColor: AppColors.white,
                      titleSize: 12.sp,
                    ),
                  ),
                ],
              ),
              10.height,
              CommonButton(
                titleText: 'Massage',
                onTap: () {
                  Get.toNamed(
                    RecruiterRoutes.message,
                    arguments: {
                      'chatId': '1234567890',
                      'name': 'John Doe',
                      'image': AppImages.profile,
                    },
                  );
                },
                buttonColor: AppColors.transparent,
                titleColor: AppColors.primary,
                buttonHeight: 38.h,
                titleSize: 14.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
