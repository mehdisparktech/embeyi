import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Section Header Widget
class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAllTap;

  const SectionHeader({super.key, required this.title, this.onSeeAllTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText(
          text: title,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
          textAlign: TextAlign.start,
        ),
        if (onSeeAllTap != null)
          GestureDetector(
            onTap: onSeeAllTap,
            child: Row(
              children: [
                CommonText(
                  text: 'See All',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                4.width,
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12.sp,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
