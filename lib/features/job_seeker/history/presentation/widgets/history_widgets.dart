import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:embeyi/core/utils/constants/app_icons.dart';
import 'package:embeyi/core/utils/constants/app_images.dart';
import 'package:embeyi/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Application History Card Widget
class ApplicationHistoryCard extends StatelessWidget {
  final String jobTitle;
  final String companyName;
  final String location;
  final String companyLogo;
  final String status;
  final VoidCallback? onTap;

  const ApplicationHistoryCard({
    super.key,
    required this.jobTitle,
    required this.companyName,
    required this.location,
    required this.companyLogo,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildCompanyLogo(),
            12.width,
            Expanded(child: _buildJobDetails()),
            8.width,
            StatusBadge(status: status),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyLogo() {
    return Container(
      width: 85.w,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.blueLight,
      ),
      clipBehavior: Clip.antiAlias,
      child: CommonImage(imageSrc: companyLogo, fill: BoxFit.cover),
    );
  }

  Widget _buildJobDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: jobTitle,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
          textAlign: TextAlign.start,
          maxLines: 2,
        ),
        4.height,
        CommonText(
          text: companyName,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryButton,
          textAlign: TextAlign.start,
        ),
        6.height,
        Row(
          children: [
            CommonImage(imageSrc: AppIcons.location, size: 14.sp),
            4.width,
            Expanded(
              child: CommonText(
                text: location,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryText,
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Status Badge Widget
class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'applied':
        return AppColors.primary;
      case 'interview':
        return AppColors.success;
      case 'rejected':
        return AppColors.red;
      default:
        return AppColors.secondaryText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),

      child: CommonText(
        text: status,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: _getStatusColor(),
      ),
    );
  }
}

// Custom Tab Widget
class CustomTabButton extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CustomTabButton({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.secondaryPrimary : AppColors.white,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: isSelected
              ? AppColors.secondaryPrimary
              : AppColors.borderColor,
          width: 1,
        ),
      ),
      child: CommonText(
        text: title,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: isSelected ? AppColors.white : AppColors.primaryText,
      ),
    );
  }
}

// Empty State Widget for History
class EmptyHistoryState extends StatelessWidget {
  final String message;

  const EmptyHistoryState({super.key, this.message = 'No applications found'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.work_outline,
            size: 80.sp,
            color: AppColors.secondaryText.withOpacity(0.5),
          ),
          16.height,
          CommonText(
            text: message,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.secondaryText,
          ),
        ],
      ),
    );
  }
}

// Application Details Header Card
class ApplicationDetailsHeaderCard extends StatelessWidget {
  final String hiringStatus;
  final String jobTitle;
  final String companyName;
  final String location;
  final String status;
  final String? companyLogo;

  const ApplicationDetailsHeaderCard({
    super.key,
    required this.hiringStatus,
    required this.jobTitle,
    required this.companyName,
    required this.location,
    required this.status,
    this.companyLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildCompanyLogo(),
          12.width,
          Expanded(child: _buildCompanyInfo()),
          8.width,
          StatusBadge(status: status),
        ],
      ),
    );
  }

  Widget _buildCompanyLogo() {
    return Container(
      width: 80.w,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.red.withOpacity(0.1),
      ),
      clipBehavior: Clip.antiAlias,
      child: companyLogo != null
          ? CommonImage(imageSrc: companyLogo!, fill: BoxFit.cover)
          : CommonImage(imageSrc: AppImages.jobPost, fill: BoxFit.cover),
    );
  }

  Widget _buildCompanyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: jobTitle,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
          textAlign: TextAlign.start,
          maxLines: 2,
        ),
        4.height,
        CommonText(
          text: companyName,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.secondaryButton,
          textAlign: TextAlign.start,
        ),
        6.height,
        Row(
          children: [
            CommonImage(imageSrc: AppIcons.location, size: 14.sp),
            4.width,
            Expanded(
              child: CommonText(
                text: location,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryText,
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Timeline Item Widget
class TimelineItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isCompleted;
  final bool isLast;

  const TimelineItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isCompleted,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  _buildTimelineIndicator(),
        16.width,
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 20.h),
            child: _buildTimelineContent(),
          ),
        ),
      ],
    );
  }

  // ignore: unused_element
  Widget _buildTimelineIndicator() {
    return Column(
      children: [
        Container(
          width: 24.w,
          height: 24.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted ? AppColors.success : AppColors.white,
            border: Border.all(
              color: isCompleted ? AppColors.success : AppColors.borderColor,
              width: 2,
            ),
          ),
          child: isCompleted
              ? Icon(Icons.check, size: 14.sp, color: AppColors.white)
              : null,
        ),
        if (!isLast)
          Container(
            width: 2,
            height: 40.h,
            color: AppColors.borderColor.withOpacity(0.5),
          ),
      ],
    );
  }

  Widget _buildTimelineContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          textAlign: TextAlign.start,
        ),
        4.height,
        CommonText(
          text: subtitle,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryText,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

// Attachment Card Widget
class AttachmentCard extends StatelessWidget {
  final String fileName;
  final String fileType;
  final String fileSize;
  final VoidCallback? onTap;

  const AttachmentCard({
    super.key,
    required this.fileName,
    required this.fileType,
    required this.fileSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.borderColor.withOpacity(0.5)),
        ),
        child: Row(
          children: [
            _buildFileIcon(),
            12.width,
            Expanded(child: _buildFileInfo()),
          ],
        ),
      ),
    );
  }

  Widget _buildFileIcon() {
    return Container(
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(Icons.picture_as_pdf, size: 28.sp, color: AppColors.red),
    );
  }

  Widget _buildFileInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: fileName,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
          textAlign: TextAlign.start,
          maxLines: 1,
        ),
        4.height,
        CommonText(
          text: '$fileType $fileSize',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryText,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

// Section Header Widget for Details Page
class DetailsSectionHeader extends StatelessWidget {
  final String title;

  const DetailsSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CommonText(
      text: title,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryText,
      textAlign: TextAlign.start,
    );
  }
}

// Interview Card Widget with Date
class InterviewJobCard extends StatelessWidget {
  final String jobTitle;
  final String companyName;
  final String location;
  final String companyLogo;
  final String interviewDate;
  final VoidCallback? onTap;

  const InterviewJobCard({
    super.key,
    required this.jobTitle,
    required this.companyName,
    required this.location,
    required this.companyLogo,
    required this.interviewDate,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildCompanyLogo(),
            12.width,
            Expanded(child: _buildJobDetails()),
            8.width,
            _buildDateBadge(),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyLogo() {
    return Container(
      width: 85.w,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.blueLight,
      ),
      clipBehavior: Clip.antiAlias,
      child: CommonImage(imageSrc: companyLogo, fill: BoxFit.cover),
    );
  }

  Widget _buildJobDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: jobTitle,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
          textAlign: TextAlign.start,
          maxLines: 2,
        ),
        4.height,
        CommonText(
          text: companyName,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.secondaryButton,
          textAlign: TextAlign.start,
        ),
        6.height,
        Row(
          children: [
            CommonImage(imageSrc: AppIcons.location, size: 14.sp),
            4.width,
            Expanded(
              child: CommonText(
                text: location,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryText,
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDateBadge() {
    Color dateColor = AppColors.secondaryPrimary;
    if (interviewDate == 'Today') {
      dateColor = AppColors.secondaryPrimary;
    } else if (interviewDate == 'Tomorrow') {
      dateColor = Colors.orange;
    } else {
      dateColor = Colors.orange;
    }

    return CommonText(
      text: interviewDate,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: dateColor,
    );
  }
}

// Interview Filter Buttons
class InterviewFilterButtons extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onFilterChanged;

  const InterviewFilterButtons({
    super.key,
    required this.selectedIndex,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(child: _buildFilterButton('Upcoming', 0)),
          12.width,
          Expanded(child: _buildFilterButton('Complete', 1)),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String title, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onFilterChanged(index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: ShapeDecoration(
          gradient: isSelected
              ? LinearGradient(
                  begin: Alignment(0.00, 0.50),
                  end: Alignment(1.00, 0.50),
                  colors: [const Color(0xFF123499), const Color(0xFF2956DD)],
                )
              : null,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: const Color(0xFFC8C8C8) /* Disable */,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Center(
          child: CommonText(
            text: title,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: isSelected ? AppColors.white : AppColors.primaryText,
          ),
        ),
      ),
    );
  }
}
