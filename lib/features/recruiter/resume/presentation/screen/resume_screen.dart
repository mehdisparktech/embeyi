import 'package:embeyi/core/component/appbar/common_appbar.dart';
import 'package:embeyi/core/component/button/common_button.dart';
import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

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
              icon: Icon(
                Icons.download_outlined,
                color: AppColors.white,
                size: 20.sp,
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
                      onTap: () {},
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
                      onTap: () {},
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
                onTap: () {},
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
