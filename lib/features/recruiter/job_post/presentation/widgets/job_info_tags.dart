// Job Info Tags Widget
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobInfoTags extends StatelessWidget {
  final bool isFullTime;
  final String experience;
  final String postedDate;
  final String endDate;

  const JobInfoTags({
    super.key,
    required this.isFullTime,
    required this.experience,
    required this.postedDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: [
        _buildInfoTag(isFullTime ? 'Full Time' : 'Part Time'),
        _buildInfoTag('Onsite'),
        _buildInfoTag(experience),
      ],
    );
  }

  Widget _buildInfoTag(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.secondaryButton.withOpacity(0.3)),
      ),
      child: CommonText(
        text: label,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryText,
      ),
    );
  }
}
