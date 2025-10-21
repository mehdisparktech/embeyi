import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/button/common_button.dart';
import 'add_education_screen.dart';
import 'edit_education_screen.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

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
          text: 'Education',
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
          color: AppColors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView(
                  children: [
                    SizedBox(height: 20.h),
                    _buildEducationCard(
                      degree: 'Web in Design',
                      institute: 'Oxford University',
                      session: '2020-2024',
                      passingYear: '2024',
                      gpa: '5.00',
                      onEdit: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditEducationScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    _buildEducationCard(
                      degree: 'Computer Science',
                      institute: 'Oxford University',
                      session: '2020-2024',
                      passingYear: '2026',
                      gpa: '5.00',
                      onEdit: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditEducationScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: CommonButton(
                titleText: 'Add New',
                buttonHeight: 50.h,
                titleSize: 16.sp,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddEducationScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationCard({
    required String degree,
    required String institute,
    required String session,
    required String passingYear,
    required String gpa,
    required VoidCallback onEdit,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: degree,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              GestureDetector(
                onTap: onEdit,
                child: CommonImage(
                  imageSrc: AppIcons.edit,
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          CommonText(
            text: institute,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.success,
          ),
          SizedBox(height: 4.h),
          _buildLabel('Session', session),
          SizedBox(height: 4.h),
          _buildLabel('Passing Year', passingYear),
          SizedBox(height: 4.h),
          _buildLabel('Grade Point', gpa),
        ],
      ),
    );
  }

  Widget _buildLabel(String text, String secondText) {
    return Row(
      children: [
        CommonText(
          text: '$text: ',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryText,
        ),
        CommonText(
          text: secondText,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryText,
        ),
      ],
    );
  }
}
