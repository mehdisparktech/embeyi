import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/text_field/common_text_field.dart';
import '../../../../../../core/component/button/common_button.dart';

class EditSkillsScreen extends StatefulWidget {
  const EditSkillsScreen({super.key});

  @override
  State<EditSkillsScreen> createState() => _EditSkillsScreenState();
}

class _EditSkillsScreenState extends State<EditSkillsScreen> {
  final TextEditingController _skillController = TextEditingController();
  final List<String> _skills = [
    'Figma',
    'UX Design',
    'Website Design',
    'Prototyping',
    'Wireframing',
    'App Design',
  ];

  void _addSkill() {
    if (_skillController.text.trim().isNotEmpty) {
      setState(() {
        _skills.add(_skillController.text.trim());
        _skillController.clear();
      });
    }
  }

  void _removeSkill(int index) {
    setState(() {
      _skills.removeAt(index);
    });
  }

  @override
  void dispose() {
    _skillController.dispose();
    super.dispose();
  }

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
          text: 'Skills',
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
          color: AppColors.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              // Add Skills Title
              CommonText(
                text: 'Add Skills',
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: AppColors.black,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 16.h),
              // Skills Label
              CommonText(
                text: 'Skills',
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColors.black,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8.h),
              // Skills Input Field
              CommonTextField(
                controller: _skillController,
                hintText: 'Prototyping',
                fillColor: AppColors.white,
                borderColor: AppColors.borderColor,
                borderRadius: 8,
                paddingHorizontal: 16,
                paddingVertical: 14,
                textInputAction: TextInputAction.done,
                onSubmitted: (value) => _addSkill(),
              ),
              SizedBox(height: 16.h),
              // Add Button
              Center(
                child: SizedBox(
                  width: 140.w,
                  height: 40.h,
                  child: CommonButton(
                    titleText: 'Add',
                    buttonColor: AppColors.secondaryPrimary,
                    titleColor: AppColors.white,
                    buttonRadius: 8,
                    buttonHeight: 40.h,
                    buttonWidth: 140.w,
                    titleSize: 16,
                    titleWeight: FontWeight.w600,
                    isGradient: false,
                    borderColor: AppColors.secondaryPrimary,
                    onTap: _addSkill,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              // Skills Chips
              Wrap(
                spacing: 12.w,
                runSpacing: 12.h,
                children: List.generate(
                  _skills.length,
                  (index) => _buildSkillChip(_skills[index], index),
                ),
              ),
              Spacer(),
              // Update Button
              CommonButton(
                titleText: 'Update',
                buttonColor: AppColors.primaryColor,
                titleColor: AppColors.white,
                buttonRadius: 8,
                buttonHeight: 48.h,
                titleSize: 16,
                titleWeight: FontWeight.w600,
                onTap: () {
                  // Handle update
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillChip(String skill, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Color(0xFFEFE6F5),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonText(
            text: skill,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () => _removeSkill(index),
            child: Icon(Icons.close, size: 16.sp, color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
