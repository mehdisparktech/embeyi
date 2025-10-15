import 'package:embeyi/core/config/route/job_seeker_routes.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/button/common_button.dart';
import '../../widgets/info_card.dart';
import '../../widgets/profile_section.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

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
          text: 'Personal Info',
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
          color: AppColors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              _buildProfileSection(),
              SizedBox(height: 32.h),
              _buildPersonalDetailsCard(),
              SizedBox(height: 16.h),
              _buildContactDetailsCard(),
              SizedBox(height: 16.h),
              _buildSummaryCard(),
              SizedBox(height: 40.h),
              _buildEditProfileButton(context),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return ProfileSection(
      name: 'Shakir Ahmed',
      designation: 'UI/UX Designer',
      imagePath: 'assets/images/profile.png',
    );
  }

  Widget _buildPersonalDetailsCard() {
    return InfoCard(
      children: [
        InfoRow(label: 'Gender', value: 'Male'),
        const InfoDivider(),
        InfoRow(label: 'Date Of Birth', value: '01 January 2000'),
        const InfoDivider(),
        InfoRow(label: 'Nationality', value: 'American'),
        const InfoDivider(),
        InfoRow(label: 'Language', value: 'English'),
        const InfoDivider(),
        InfoRow(label: 'Address', value: 'Derby Ave, Strubens Valley, Gauteng'),
      ],
    );
  }

  Widget _buildContactDetailsCard() {
    return InfoCard(
      children: [
        InfoRow(label: 'Mobile', value: '+99123456789'),
        const InfoDivider(),
        InfoRow(label: 'Email', value: 'User@Gmail.Com'),
        const InfoDivider(),
        InfoRow(label: 'LinkedIn', value: 'Linkedin.Com/Profile'),
      ],
    );
  }

  Widget _buildSummaryCard() {
    return InfoCard(
      children: [
        CommonText(
          text: 'Summary',
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: AppColors.black,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 12.h),
        CommonText(
          text:
              'Creative And Detail-Oriented UI/UX Designer With Expertise in Crafting Intuitive Mobile And Web Experiences. Skilled in Wireframing, Prototyping, And Design Systems',
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: AppColors.black,
          textAlign: TextAlign.left,
          maxLines: 4,
        ),
      ],
    );
  }

  Widget _buildEditProfileButton(BuildContext context) {
    return CommonButton(
      titleText: 'Edit Profile',
      titleSize: 16.sp,
      titleWeight: FontWeight.w600,
      buttonHeight: 52.h,
      buttonRadius: 12.r,
      onTap: () {
        // Navigate to edit personal info screen
        JobSeekerRoutes.goToEditPersonalInfo();
      },
    );
  }
}
