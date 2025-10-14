import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/utils/extensions/extension.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: 'My Profile',
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Personal Information Section
                const CommonText(
                  text: 'Personal Information',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                16.height,
                _buildInfoCard('Full Name', 'John Doe', Icons.person),
                12.height,
                _buildInfoCard('Email', 'johndoe@example.com', Icons.email),
                12.height,
                _buildInfoCard('Phone', '+1 234 567 8900', Icons.phone),
                12.height,
                _buildInfoCard('Location', 'New York, USA', Icons.location_on),
                24.height,

                /// Professional Information Section
                const CommonText(
                  text: 'Professional Information',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                16.height,
                _buildInfoCard('Job Title', 'UI/UX Designer', Icons.work),
                12.height,
                _buildInfoCard('Experience', '5 Years', Icons.timeline),
                12.height,
                _buildInfoCard(
                  'Skills',
                  'Figma, Adobe XD, Sketch, Prototyping',
                  Icons.emoji_objects,
                ),
                24.height,

                /// About Me Section
                const CommonText(
                  text: 'About Me',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                16.height,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.filledColor,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: CommonText(
                    text:
                        'Passionate UI/UX Designer with 5 years of experience creating intuitive and user-friendly digital experiences. Skilled in user research, wireframing, prototyping, and visual design.',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryText,
                    maxLines: 10,
                  ),
                ),
                32.height,

                /// Edit Profile Button
                CommonButton(
                  titleText: 'Edit Profile',
                  onTap: () {
                    // Navigate to edit profile screen
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: AppColors.primaryColor, size: 24.sp),
          ),
          16.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: label,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryText,
                ),
                4.height,
                CommonText(
                  text: value,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
