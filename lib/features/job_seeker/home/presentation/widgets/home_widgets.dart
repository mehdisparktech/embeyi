import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Home Header Widget
class HomeHeader extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String userRole;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onMessageTap;
  final VoidCallback? onProfileTap;

  const HomeHeader({
    super.key,
    required this.profileImage,
    required this.userName,
    required this.userRole,
    this.onNotificationTap,
    this.onMessageTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onProfileTap,
          child: CircleAvatar(
            radius: 24.r,
            backgroundColor: AppColors.blueLight,
            child: ClipOval(
              child: CommonImage(
                imageSrc: profileImage,
                size: 48.sp,
                fill: BoxFit.cover,
              ),
            ),
          ),
        ),
        12.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: userName,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
                textAlign: TextAlign.start,
              ),
              2.height,
              CommonText(
                text: userRole,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryText,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onMessageTap,
          icon: Icon(
            Icons.chat_bubble_outline,
            size: 24.sp,
            color: AppColors.primaryColor,
          ),
        ),
        8.width,
        IconButton(
          onPressed: onNotificationTap,
          icon: Icon(
            Icons.notifications_outlined,
            size: 24.sp,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}

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
              child: Icon(Icons.tune, color: AppColors.black, size: 32.sp),
            ),
          ),
        ),
      ],
    );
  }
}

// Hero Banner Widget
class HeroBanner extends StatelessWidget {
  final String bannerImage;
  final VoidCallback? onTap;

  const HeroBanner({super.key, required this.bannerImage, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: CommonImage(imageSrc: bannerImage, fill: BoxFit.cover),
        ),
      ),
    );
  }
}

// Job Category Card Widget
class JobCategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? backgroundColor;

  const JobCategoryCard({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24.sp, color: iconColor ?? AppColors.primaryColor),
            10.height,
            CommonText(
              text: title,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryText,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

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
