import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:embeyi/core/component/appbar/common_appbar.dart';
import 'package:embeyi/core/component/button/common_button.dart';
import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_icons.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';

class CompleteInterviewDetailsScreen extends StatelessWidget {
  const CompleteInterviewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppbar(
        title: 'Interview',
        showLeading: true,
        centerTitle: true,
        backgroundColor: AppColors.white,
        textColor: AppColors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildJobTitleSection(),
              16.height,
              _buildInterviewerCard(),
              16.height,
              _buildTimelineSection(),
              16.height,
              _buildResumeSection(),
              16.height,
              _buildMessageButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Job Title Section
  Widget _buildJobTitleSection() {
    return Container(
      padding: EdgeInsets.all(20.w),
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Job Title
          CommonText(
            text: 'Senior UI/UX Designer',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          8.height,
          // Location
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonImage(
                imageSrc: AppIcons.location,
                size: 18.w,
                imageColor: AppColors.secondaryText,
              ),
              4.width,
              Flexible(
                child: CommonText(
                  text: '21B Thonridge Cir. Syracuse, Connecticut 35624',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryText,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          12.height,
          // Salary
          CommonText(
            text: '\$40,000 - \$50,000',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            textAlign: TextAlign.center,
          ),
          12.height,
          // Job Type Chips
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildChip('Full Time'),
              8.width,
              _buildChip('On Site'),
              8.width,
              _buildChip('3 Yrs Experience'),
            ],
          ),
          12.height,
          // Posted Info
          CommonText(
            text: 'Posted 3 Days Ago, End Date 31 Dec',
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryText,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  // Chip Widget
  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: CommonText(
        text: label,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryText,
        textAlign: TextAlign.center,
      ),
    );
  }

  // Interviewer Card
  Widget _buildInterviewerCard() {
    return Container(
      padding: const EdgeInsets.all(10),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.filledColor,
            ),
            // Replace with actual image when available
            child: CommonImage(imageSrc: AppImages.profile, size: 60.w),
          ),
          12.width,
          // Candidate Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: 'Cameron Williamson',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  textAlign: TextAlign.left,
                ),
                4.height,
                CommonText(
                  text: 'Sr. UUX Designer',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  textAlign: TextAlign.left,
                ),
                4.height,
                CommonText(
                  text: '3 Years Experience',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryText,
                  textAlign: TextAlign.left,
                ),
                4.height,
                CommonText(
                  text: 'Interview Date: 04 Oct 2025 At 09 Am',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryText,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Timeline Section
  Widget _buildTimelineSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: 'Timeline',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
            textAlign: TextAlign.left,
          ),
          16.height,
          _buildTimelineItem(
            title: 'Applied',
            date: '01 Sep 2025',
            isStatus: false,
          ),
          16.height,
          _buildTimelineItem(
            title: 'Short Listed',
            date: '02 Sep 2025',
            isStatus: false,
          ),
          16.height,
          _buildTimelineItem(
            title: 'Interview',
            date: '05 Sep 2025',
            status: 'Complete',
            statusColor: AppColors.success,
            isStatus: false,
          ),
          16.height,
          _buildTimelineItem(
            title: 'Status',
            date: '08 Sep 2025',
            status: 'Reject',
            statusColor: AppColors.red,
            isStatus: true,
          ),
        ],
      ),
    );
  }

  // Timeline Item
  Widget _buildTimelineItem({
    required String title,
    required String date,
    String? status,
    Color? statusColor,
    required bool isStatus,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: title,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
            textAlign: TextAlign.left,
          ),
          4.height,
          CommonText(
            text: isStatus ? date : date,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: isStatus && status == 'Reject'
                ? AppColors.red
                : AppColors.secondaryText,
          ),
        ],
      ),
    );
  }

  // Resume Section
  Widget _buildResumeSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
      decoration: ShapeDecoration(
        color: Colors.white /* White-BG */,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          // PDF Icon
          CommonImage(imageSrc: AppIcons.pdf, size: 24.w),
          12.width,
          // Resume Text
          Expanded(
            child: CommonText(
              text: 'Resume.Pdf',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              textAlign: TextAlign.left,
            ),
          ),
          // Download Icon
          CommonImage(
            imageSrc: AppIcons.download,
            size: 20.w,
            imageColor: AppColors.black,
          ),
        ],
      ),
    );
  }

  // Message Button
  Widget _buildMessageButton() {
    return CommonButton(
      titleText: 'Message',
      titleSize: 16,
      titleWeight: FontWeight.w600,
      buttonHeight: 50.h,
      buttonRadius: 8.r,
      titleColor: AppColors.primaryColor,
      buttonColor: AppColors.white,
      isGradient: false,
      borderColor: AppColors.primaryColor,
      onTap: () {
        // Handle message
      },
    );
  }
}
