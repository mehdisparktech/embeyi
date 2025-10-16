import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobTitleSection extends StatelessWidget {
  final String jobTitle;
  final String location;
  final String salary;

  const JobTitleSection({
    super.key,
    required this.jobTitle,
    required this.location,
    required this.salary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonText(
          text: jobTitle,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
        8.height,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 16.sp,
              color: AppColors.primaryText,
            ),
            4.width,
            CommonText(
              text: location,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryText,
            ),
          ],
        ),
        8.height,
        CommonText(
          text: salary,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryText,
        ),
      ],
    );
  }
}
