import 'package:embeyi/core/component/card/job_card.dart';
import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/config/route/job_seeker_routes.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Company Hero Header - Image with logo overlay
class CompanyHeroHeader extends StatelessWidget {
  final String companyImage;
  final String? companyLogo;

  const CompanyHeroHeader({
    super.key,
    required this.companyImage,
    this.companyLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.blueLight),
      child: Stack(
        children: [
          // Background company image
          Positioned.fill(
            child: CommonImage(imageSrc: companyImage, fill: BoxFit.cover),
          ),
          // Logo overlay at the bottom center
          Positioned(
            bottom: -30.h,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 80.w,
                height: 80.h,
                decoration: ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 2.50,
                      color: const Color(0xFFEDEDED),
                    ),
                  ),
                ),
                child: CommonImage(
                  imageSrc: companyLogo!,
                  fill: BoxFit.cover,
                  height: 80.h,
                  width: 80.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Company Name and Tagline Widget
class CompanyNameSection extends StatelessWidget {
  final String companyName;
  final String tagline;

  const CompanyNameSection({
    super.key,
    required this.companyName,
    required this.tagline,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        40.height, // Space for the logo overlap
        CommonText(
          text: companyName,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
          textAlign: TextAlign.center,
        ),
        8.height,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CommonText(
            text: tagline,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryText,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}

// Tab Navigation Widget
class CompanyTabNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  final List<String> tabs;

  const CompanyTabNavigation({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    this.tabs = const ['Home', 'About', 'Jobs'],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(4.r),

      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected(index),
              child: Container(
                margin: EdgeInsets.only(right: 8.w),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: ShapeDecoration(
                  color: isSelected
                      ? AppColors.secondaryPrimary
                      : AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0xFFC8C8C8) /* Disable */,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Center(
                  child: CommonText(
                    text: tabs[index],
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: isSelected
                        ? AppColors.white
                        : AppColors.secondaryText,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// Section Title Widget
class CompanySectionTitle extends StatelessWidget {
  final String title;

  const CompanySectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CommonText(
        text: title,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryText,
        textAlign: TextAlign.start,
      ),
    );
  }
}

// Overview Content Widget
class CompanyOverviewContent extends StatelessWidget {
  final String description;

  const CompanyOverviewContent({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CommonText(
        text: description,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryText,
        textAlign: TextAlign.justify,
        maxLines: 100,
      ),
    );
  }
}

// Gallery Grid Widget
class CompanyGalleryGrid extends StatelessWidget {
  final List<String> images;
  final int crossAxisCount;

  const CompanyGalleryGrid({
    super.key,
    required this.images,
    this.crossAxisCount = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: 1,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GalleryImageCard(
            imageSrc: images[index],
            onTap: () {
              // Handle image tap - can show full screen image
            },
          );
        },
      ),
    );
  }
}

// Gallery Image Card Widget
class GalleryImageCard extends StatelessWidget {
  final String imageSrc;
  final VoidCallback? onTap;

  const GalleryImageCard({super.key, required this.imageSrc, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.h,
        width: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.blueLight,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: CommonImage(imageSrc: imageSrc, fill: BoxFit.cover),
        ),
      ),
    );
  }
}

// About Content Widget (for About tab)
class CompanyAboutContent extends StatelessWidget {
  final String aboutText;

  const CompanyAboutContent({super.key, required this.aboutText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: aboutText,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryText,
            textAlign: TextAlign.justify,
            maxLines: 100,
          ),
        ],
      ),
    );
  }
}

// Jobs List Widget (for Jobs tab)
class CompanyJobsList extends StatelessWidget {
  final List<CompanyJobItem> jobs;

  const CompanyJobsList({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
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

// Company Job Card Widget
class CompanyJobCard extends StatelessWidget {
  final CompanyJobItem job;

  const CompanyJobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE8E8E8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: job.title,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText,
          ),
          8.height,
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 14.sp,
                color: AppColors.secondaryText,
              ),
              4.width,
              Expanded(
                child: CommonText(
                  text: job.location,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
          8.height,
          CommonText(
            text: job.salary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.secondaryButton,
          ),
        ],
      ),
    );
  }
}

// Model class for company jobs
class CompanyJobItem {
  final String title;
  final String location;
  final String salary;

  CompanyJobItem({
    required this.title,
    required this.location,
    required this.salary,
  });
}
