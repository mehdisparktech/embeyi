import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/utils/extensions/extension.dart';

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
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          separatorBuilder: (context, index) => 16.height,
          itemBuilder: (context, index) {
            return _buildJobCard(
              companyName: 'Tech Company ${index + 1}',
              jobTitle: 'Senior UI/UX Designer',
              location: 'New York, USA',
              salary: '\$80,000 - \$120,000',
              jobType: 'Full Time',
              postedDate: '2 days ago',
            );
          },
        ),
      ),
    );
  }

  Widget _buildJobCard({
    required String companyName,
    required String jobTitle,
    required String location,
    required String salary,
    required String jobType,
    required String postedDate,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Icon(
                    Icons.business,
                    color: AppColors.primaryColor,
                    size: 28.sp,
                  ),
                ),
              ),
              12.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: companyName,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryText,
                    ),
                    4.height,
                    CommonText(
                      text: jobTitle,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  // Remove from favorites
                },
                icon: Icon(Icons.favorite, color: AppColors.error, size: 24.sp),
              ),
            ],
          ),
          16.height,
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 16.sp,
                color: AppColors.secondaryText,
              ),
              4.width,
              CommonText(
                text: location,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ],
          ),
          8.height,
          Row(
            children: [
              Icon(
                Icons.attach_money,
                size: 16.sp,
                color: AppColors.secondaryText,
              ),
              4.width,
              CommonText(
                text: salary,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ],
          ),
          16.height,
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: CommonText(
                  text: jobType,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
              const Spacer(),
              CommonText(
                text: postedDate,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
