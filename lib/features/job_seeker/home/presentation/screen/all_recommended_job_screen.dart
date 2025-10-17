import 'package:embeyi/core/component/card/job_card.dart';
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/config/route/job_seeker_routes.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllRecommendedJobScreen extends StatelessWidget {
  const AllRecommendedJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonText(
          text: 'Recommended Jobs',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: 'Auto Apply',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        CommonText(
                          text: 'Let the ai apply for You',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.secondaryText,
                        ),
                      ],
                    ),
                    Switch(
                      value: false,
                      activeColor: AppColors.white,
                      inactiveTrackColor: AppColors.grey,
                      inactiveThumbColor: AppColors.black,
                      activeTrackColor: AppColors.primaryColor,
                      onChanged: (value) {
                        // Handle switch change
                        print(value);
                      },
                      padding: EdgeInsets.zero,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: JobCard(
                      companyName: 'UX-Pilot',
                      location: 'California, United State.',
                      jobTitle: 'Sr. UI/UX Designer',
                      salaryRange: '\$7k - \$15k/month',
                      timePosted: '01 Dec 25',
                      isFullTime: true,
                      companyLogo: AppImages.jobPost,
                      onTap: () {
                        JobSeekerRoutes.goToJobDetails();
                      },
                      onFavoriteTap: () {
                        // Handle favorite tap
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
