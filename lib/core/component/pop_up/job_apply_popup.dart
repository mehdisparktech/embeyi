import 'package:embeyi/core/component/button/common_button.dart';
import 'package:embeyi/core/component/image/common_image.dart';
import 'package:embeyi/core/component/text/common_text.dart';
import 'package:embeyi/core/component/text_field/common_text_field.dart';
import 'package:embeyi/core/utils/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/extensions/extension.dart';

class JobApplyPopup extends StatefulWidget {
  final String jobTitle;
  final String companyName;
  final String companyLogo;
  final String location;
  final String deadline;
  final bool isFullTime;
  final bool isRemote;
  final String? companyDescription;
  final VoidCallback? onApply;
  const JobApplyPopup({
    super.key,
    required this.jobTitle,
    required this.companyName,
    required this.companyLogo,
    required this.location,
    required this.deadline,
    this.isFullTime = true,
    this.isRemote = false,
    this.companyDescription,
    this.onApply,
  });

  @override
  State<JobApplyPopup> createState() => _JobApplyPopupState();
}

class _JobApplyPopupState extends State<JobApplyPopup> {
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  String? _resumeFileName;
  String? _coverLetterFileName;

  @override
  void initState() {
    super.initState();
    _jobTitleController.text = widget.jobTitle;
  }

  @override
  void dispose() {
    _jobTitleController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  void _pickResume() {
    // TODO: Implement file picker for resume
    setState(() {
      _resumeFileName = 'Resume.Pdf';
    });
  }

  void _pickCoverLetter() {
    setState(() {
      _coverLetterFileName = 'CoverLetter.Pdf';
    });
  }

  void _removeResume() {
    setState(() {
      _resumeFileName = null;
    });
  }

  void _removeCoverLetter() {
    setState(() {
      _coverLetterFileName = null;
    });
  }

  void _submitApplication() {
    Navigator.pop(context);
    widget.onApply?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildHeader(),
                    _buildJobCard(),
                    _buildFormSection(),
                  ],
                ),
              ),
            ),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(right: 12.w, top: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.close, size: 24.sp, color: AppColors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildJobCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.borderColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Logo
              Container(
                width: 84.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.cardBackground,
                ),
                clipBehavior: Clip.antiAlias,
                child: CommonImage(
                  imageSrc: widget.companyLogo,
                  fill: BoxFit.cover,
                ),
              ),
              12.width,
              // Job Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Job Title
                    CommonText(
                      text: widget.jobTitle,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                    ),
                    4.height,
                    // Company Name
                    CommonText(
                      text: widget.companyName,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryButton,
                      textAlign: TextAlign.start,
                    ),
                    6.height,
                    // Job Type Tags
                    Row(
                      children: [
                        if (widget.isFullTime) _buildJobTypeTag('Full Time'),
                        if (widget.isFullTime && widget.isRemote) 8.width,
                        if (widget.isRemote) _buildJobTypeTag('Remote'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          10.height,
          // Location and Date Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Location
              Expanded(
                child: Row(
                  children: [
                    CommonImage(imageSrc: AppIcons.location, size: 14.sp),
                    4.width,
                    Expanded(
                      child: CommonText(
                        text: widget.location,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              8.width,
              // Deadline
              Row(
                children: [
                  CommonImage(imageSrc: AppIcons.calender, size: 16.sp),
                  4.width,
                  CommonText(
                    text: widget.deadline,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondaryPrimary,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildJobTypeTag(String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6.w,
          height: 6.h,
          decoration: const BoxDecoration(
            color: AppColors.secondaryButton,
            shape: BoxShape.circle,
          ),
        ),
        4.width,
        CommonText(
          text: label,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryText,
        ),
      ],
    );
  }

  Widget _buildFormSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Job Title Field
          _buildFieldLabel('Job Title'),
          8.height,
          CommonTextField(
            controller: _jobTitleController,
            hintText: 'UI/UX Designer',
            borderRadius: 8,
            paddingVertical: 12,
            fillColor: AppColors.white,
            borderColor: AppColors.borderColor,
          ),
          16.height,

          // Years of Experience Field
          _buildFieldLabel('Years Of Experience'),
          8.height,
          CommonTextField(
            controller: _experienceController,
            hintText: '5 Years',
            borderRadius: 8,
            paddingVertical: 12,
            fillColor: AppColors.white,
            borderColor: AppColors.borderColor,
          ),
          16.height,

          // Resume Upload
          _buildFieldLabel('Resume'),
          8.height,
          _buildFileUploadSection(
            fileName: _resumeFileName,
            onTap: _pickResume,
            onRemove: _removeResume,
          ),
          16.height,

          // Cover Letter Upload
          _buildFieldLabel('Cover Letter'),
          8.height,
          _buildFileUploadSection(
            fileName: _coverLetterFileName,
            onTap: _pickCoverLetter,
            onRemove: _removeCoverLetter,
            showUploadIcon: true,
          ),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return CommonText(
      text: label,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      textAlign: TextAlign.start,
    );
  }

  Widget _buildFileUploadSection({
    String? fileName,
    required VoidCallback onTap,
    required VoidCallback onRemove,
    bool showUploadIcon = false,
  }) {
    return GestureDetector(
      onTap: fileName == null ? onTap : null,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          children: [
            if (fileName != null) ...[
              // PDF Icon
              Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: CommonImage(imageSrc: AppIcons.pdf, size: 20.sp),
              ),
              12.width,
              Expanded(
                child: CommonText(
                  text: fileName,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  textAlign: TextAlign.start,
                ),
              ),
              GestureDetector(
                onTap: onRemove,
                child: CommonImage(imageSrc: AppIcons.delete, size: 20.sp),
              ),
            ] else if (showUploadIcon) ...[
              Expanded(
                child: Center(
                  child: CommonImage(imageSrc: AppIcons.upload, size: 24.sp),
                ),
              ),
            ] else ...[
              Expanded(
                child: CommonText(
                  text: 'Upload File',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: CommonButton(
        titleText: 'Submit',
        onTap: _submitApplication,
        buttonRadius: 8,
        titleSize: 16,
        buttonHeight: 48.h,
      ),
    );
  }
}
