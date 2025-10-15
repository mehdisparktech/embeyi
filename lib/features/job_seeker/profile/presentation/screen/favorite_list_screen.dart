import 'package:embeyi/core/component/card/job_card.dart';
import 'package:embeyi/core/config/route/job_seeker_routes.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/text/common_text.dart';

class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: 'Favorite List',
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
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
                isSaved: true,
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
      ),
    );
  }
}
