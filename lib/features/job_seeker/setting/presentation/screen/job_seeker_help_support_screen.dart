import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/text_field/common_text_field.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_string.dart';

class JobSeekerHelpSupportScreen extends StatefulWidget {
  const JobSeekerHelpSupportScreen({super.key});

  @override
  State<JobSeekerHelpSupportScreen> createState() =>
      _JobSeekerHelpSupportScreenState();
}

class _JobSeekerHelpSupportScreenState
    extends State<JobSeekerHelpSupportScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: AppString.helpAndSupport,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: _bodySection(),
    );
  }

  /// Body Section starts here
  Widget _bodySection() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameField(),
          SizedBox(height: 16.h),
          _buildDescriptionField(),
          SizedBox(height: 16.h),
          _buildAttachFileSection(),
          SizedBox(height: 24.h),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  /// Name field
  Widget _buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Reason',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryText,
        ),
        SizedBox(height: 8.h),
        CommonTextField(
          controller: _nameController,
          hintText: 'Enter your Reason',
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppString.thisFieldIsRequired;
            }
            return null;
          },
        ),
      ],
    );
  }

  /// Description field
  Widget _buildDescriptionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Description',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryText,
        ),
        SizedBox(height: 8.h),
        CommonTextField(
          controller: _descriptionController,
          hintText:
              'If you are having trouble to sign in with Account then you can Email us in Account Issues or Choosing Other Issue Regarding',
          textInputAction: TextInputAction.newline,
          maxLines: 5,
          keyboardType: TextInputType.multiline,
        ),
      ],
    );
  }

  /// Attach file section
  Widget _buildAttachFileSection() {
    return InkWell(
      onTap: () {
        // Handle file attachment
      },
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          children: [
            Icon(Icons.attach_file, size: 20.sp, color: AppColors.primaryText),
            SizedBox(width: 8.w),
            CommonText(
              text: 'Attach File',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryText,
            ),
          ],
        ),
      ),
    );
  }

  /// Submit button
  Widget _buildSubmitButton() {
    return CommonButton(
      titleText: 'Submit',
      onTap: () {
        // Handle submit action
      },
    );
  }
}
