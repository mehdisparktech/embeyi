import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';

class CompanyJobCard extends StatelessWidget {
  final String jobTitle;
  final String companyName;
  final bool isFullTime;
  final bool isRemote;
  final int candidateCount;
  final String deadline;
  final String thumbnailImage;
  final VoidCallback onTap;

  const CompanyJobCard({
    super.key,
    required this.jobTitle,
    required this.companyName,
    required this.isFullTime,
    required this.isRemote,
    required this.candidateCount,
    required this.deadline,
    required this.thumbnailImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                // Thumbnail
                Container(
                  width: 85.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                      image: AssetImage(thumbnailImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                12.width,
                // Job Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Job Title
                      Text(
                        jobTitle,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      6.height,
                      // Location
                      Text(
                        companyName,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryText,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      6.height,
                      // Job Type Tags
                      Row(
                        children: [
                          _buildJobTypeTag(
                            isFullTime ? 'Full Time' : 'Part Time',
                          ),
                          8.width,
                          _buildJobTypeTag('Remote'),
                        ],
                      ),
                      8.height,

                      // Bottom Info
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Candidate Count
                Row(
                  children: [
                    // Overlapping avatars
                    SizedBox(
                      width: 60.w,
                      height: 24.h,
                      child: Stack(
                        children: List.generate(
                          3,
                          (index) => Positioned(
                            left: index * 16.w,
                            child: Container(
                              width: 24.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[300],
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    4.width,
                    Text(
                      '$candidateCount Candidate Applied',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryText,
                      ),
                    ),
                  ],
                ),
                // Deadline
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 12.sp,
                      color: AppColors.secondaryPrimary,
                    ),
                    4.width,
                    Text(
                      deadline,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondaryPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobTypeTag(String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8.w,
          height: 8.h,
          decoration: const BoxDecoration(
            color: AppColors.secondaryButton,
            shape: BoxShape.circle,
          ),
        ),
        4.width,
        Text(
          label,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryText,
          ),
        ),
      ],
    );
  }
}
