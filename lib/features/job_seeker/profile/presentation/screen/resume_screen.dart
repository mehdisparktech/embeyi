import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/utils/extensions/extension.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: 'Resume',
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
                /// Upload Resume Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.3),
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        size: 64.sp,
                        color: AppColors.primary,
                      ),
                      16.height,
                      const CommonText(
                        text: 'Upload Your Resume',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      8.height,
                      CommonText(
                        text: 'PDF, DOC, DOCX (Max 5MB)',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryText,
                      ),
                      24.height,
                      CommonButton(
                        titleText: 'Choose File',
                        onTap: () {
                          // Handle file selection
                        },
                      ),
                    ],
                  ),
                ),
                24.height,

                /// Uploaded Resumes Section
                const CommonText(
                  text: 'My Resumes',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                16.height,

                /// Resume List
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  separatorBuilder: (context, index) => 12.height,
                  itemBuilder: (context, index) {
                    return _buildResumeCard(
                      'Resume_${index + 1}.pdf',
                      '2.5 MB',
                      'Uploaded on Jan ${10 + index}, 2025',
                      isPrimary: index == 0,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResumeCard(
    String fileName,
    String fileSize,
    String uploadDate, {
    bool isPrimary = false,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isPrimary ? AppColors.primary : AppColors.border,
          width: isPrimary ? 2 : 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.description,
                  color: AppColors.primary,
                  size: 28.sp,
                ),
              ),
              16.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CommonText(
                            text: fileName,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (isPrimary)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: CommonText(
                              text: 'Primary',
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                      ],
                    ),
                    4.height,
                    CommonText(
                      text: fileSize,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryText,
                    ),
                    4.height,
                    CommonText(
                      text: uploadDate,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryText,
                    ),
                  ],
                ),
              ),
            ],
          ),
          16.height,
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.visibility, size: 18.sp),
                  label: const CommonText(text: 'View', fontSize: 12),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: BorderSide(color: AppColors.primary),
                  ),
                ),
              ),
              12.width,
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.download, size: 18.sp),
                  label: const CommonText(text: 'Download', fontSize: 12),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: BorderSide(color: AppColors.primary),
                  ),
                ),
              ),
              12.width,
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.delete, size: 18.sp),
                  label: const CommonText(text: 'Delete', fontSize: 12),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.error,
                    side: BorderSide(color: AppColors.error),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
