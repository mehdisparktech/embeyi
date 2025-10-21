import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_icons.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Search Bar Widget
class HomeSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onFilterTap;
  final Function(String)? onChanged;

  const HomeSearchBar({
    super.key,
    this.controller,
    this.onFilterTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 6,
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: const Color(0xFFD9E7F1)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: AppColors.textFiledColor,
                  fontSize: 14.sp,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.textFiledColor,
                  size: 24.sp,
                ),

                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
              ),
            ),
          ),
        ),
        16.width,
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: onFilterTap,
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: const Color(0xFFD9E7F1)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: CommonImage(imageSrc: AppIcons.short, size: 32.sp),
            ),
          ),
        ),
      ],
    );
  }
}
