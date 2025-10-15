import 'package:embeyi/core/component/card/job_card.dart';
import 'package:embeyi/core/config/route/job_seeker_routes.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllRecommendedJobScreen extends StatelessWidget {
  const AllRecommendedJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Recommended Jobs')),
      body: ListView.builder(
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
    );
  }
}
