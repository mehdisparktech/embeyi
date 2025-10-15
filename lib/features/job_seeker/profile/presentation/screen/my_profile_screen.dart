import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/utils/extensions/extension.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: CommonText(
          text: 'My Profile',
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
          color: AppColors.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              32.height,

              /// Profile Header Section
              _buildProfileHeader(),

              48.height,

              /// Menu Items
              _buildMenuItem(
                icon: Icons.person_outline,
                title: 'Personal Info',
                subtitle: 'Complete',
                onTap: () {
                  // Navigate to personal info screen
                },
              ),

              _buildMenuItem(
                icon: Icons.school_outlined,
                title: 'Education',
                subtitle: 'Complete',
                onTap: () {
                  // Navigate to education screen
                },
              ),

              _buildMenuItem(
                icon: Icons.work_outline,
                title: 'Work Experience',
                subtitle: 'Complete',
                onTap: () {
                  // Navigate to work experience screen
                },
              ),

              _buildMenuItem(
                icon: Icons.star_outline,
                title: 'Skills',
                subtitle: 'Complete',
                onTap: () {
                  // Navigate to skills screen
                },
                isLast: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        /// Profile Image
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.borderColor.withOpacity(0.3),
              width: 1.w,
            ),
          ),
          child: ClipOval(
            child: Container(
              color: AppColors.filledColor.withOpacity(0.3),
              child: Icon(
                Icons.person,
                size: 40.sp,
                color: AppColors.secondaryText,
              ),
            ),
          ),
        ),

        16.height,

        /// Name
        CommonText(
          text: 'Shoaib Ahmad',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),

        4.height,

        /// Designation
        CommonText(
          text: 'UX Designer',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryText,
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isLast = false,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
              children: [
                /// Icon Container
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryPrimary,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(icon, color: AppColors.white, size: 20.sp),
                ),

                16.width,

                /// Title and Subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: title,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                        textAlign: TextAlign.start,
                      ),
                      2.height,
                      CommonText(
                        text: subtitle,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryText,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),

                /// Arrow Icon
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.secondaryText,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ),

        /// Divider (except for last item)
        if (!isLast)
          Divider(
            color: AppColors.borderColor.withOpacity(0.3),
            thickness: 0.5.h,
            height: 0,
          ),
      ],
    );
  }
}
