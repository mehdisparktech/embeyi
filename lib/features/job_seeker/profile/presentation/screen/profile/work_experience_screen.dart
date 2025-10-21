// ... existing code ...
import 'package:embeyi/core/component/button/common_button.dart';
import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/config/route/job_seeker_routes.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkExperienceScreen extends StatelessWidget {
  const WorkExperienceScreen({super.key});

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
          text: 'Work Experience',
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
          color: AppColors.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 16.h),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(
                                  text: 'UI/UX Designer',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: AppColors.black,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Navigate to edit screen
                                    JobSeekerRoutes.goToEditWorkExperience();
                                  },
                                  child: CommonImage(
                                    imageSrc: AppIcons.edit,
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ],
                            ),
                            CommonText(
                              text: 'Designs Hill',
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: AppColors.primary,
                            ),
                            CommonText(
                              text: '2019 - Present',
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: AppColors.textFiledColor,
                            ),
                            SizedBox(height: 2.h),
                            CommonText(
                              text:
                                  'Designing Mobile & Web Apps With Developers For Smooth, User-Friendly Experiences.',
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: AppColors.textFiledColor,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CommonButton(
                  titleText: 'Add Work Experience',
                  titleSize: 16.sp,
                  titleWeight: FontWeight.w600,
                  buttonHeight: 52.h,
                  buttonRadius: 12.r,
                  onTap: () {
                    // Navigate to add work experience screen
                    JobSeekerRoutes.goToAddWorkExperience();
                  },
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
