import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/config/route/job_seeker_routes.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_icons.dart';
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
        _buildActionIcon(
          AppIcons.chat,
          hasNotification: false,
          onTap: () {
            JobSeekerRoutes.goToChat();
          },
        ),
        8.width,
        _buildActionIcon(
          AppIcons.notification,
          hasNotification: true,
          onTap: () {
            JobSeekerRoutes.goToNotifications();
          },
        ),
      ],
    );
  }

  Widget _buildActionIcon(
    String imageSrc, {
    required bool hasNotification,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CommonImage(imageSrc: imageSrc, size: 24.sp),
          if (hasNotification)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 10.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: AppColors.secondaryPrimary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
