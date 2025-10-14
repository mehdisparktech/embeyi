import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/text_field/common_text_field.dart';
import '../../../../../../core/utils/extensions/extension.dart';

class CoreSkillsScreen extends StatefulWidget {
  const CoreSkillsScreen({super.key});

  @override
  State<CoreSkillsScreen> createState() => _CoreSkillsScreenState();
}

class _CoreSkillsScreenState extends State<CoreSkillsScreen> {
  final TextEditingController skillController = TextEditingController();
  final List<String> skills = [];

  @override
  void dispose() {
    skillController.dispose();
    super.dispose();
  }

  void _addSkill() {
    if (skillController.text.trim().isNotEmpty) {
      setState(() {
        skills.add(skillController.text.trim());
        skillController.clear();
      });
    }
  }

  void _removeSkill(int index) {
    setState(() {
      skills.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const CommonText(
          text: 'Core Skills',
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Add Skill'),
                      8.height,
                      Row(
                        children: [
                          Expanded(
                            child: CommonTextField(
                              controller: skillController,
                              hintText: 'Enter skill name',
                            ),
                          ),
                          12.width,
                          ElevatedButton(
                            onPressed: _addSkill,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 14.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            child: const CommonText(
                              text: 'Add',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      24.height,

                      if (skills.isNotEmpty) ...[
                        _buildLabel('Your Skills'),
                        12.height,
                        Wrap(
                          spacing: 8.w,
                          runSpacing: 8.h,
                          children: List.generate(
                            skills.length,
                            (index) => _buildSkillChip(skills[index], index),
                          ),
                        ),
                        24.height,
                      ],

                      _buildLabel('Suggested Skills'),
                      12.height,
                      Wrap(
                        spacing: 8.w,
                        runSpacing: 8.h,
                        children:
                            [
                                  'UI/UX Design',
                                  'Figma',
                                  'Adobe XD',
                                  'Sketch',
                                  'Prototyping',
                                  'Wireframing',
                                  'User Research',
                                  'Interaction Design',
                                ]
                                .map((skill) => _buildSuggestedSkillChip(skill))
                                .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Save Button
            Padding(
              padding: EdgeInsets.all(16.w),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: const CommonText(
                    text: 'Save',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return CommonText(
      text: text,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }

  Widget _buildSkillChip(String skill, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonText(
            text: skill,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
          8.width,
          GestureDetector(
            onTap: () => _removeSkill(index),
            child: Icon(Icons.close, size: 16.sp, color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestedSkillChip(String skill) {
    final isAdded = skills.contains(skill);
    return GestureDetector(
      onTap: () {
        if (!isAdded) {
          setState(() {
            skills.add(skill);
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isAdded
              ? AppColors.primary.withOpacity(0.1)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isAdded ? AppColors.primary : Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              text: skill,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isAdded ? AppColors.primary : Colors.grey.shade700,
            ),
            if (!isAdded) ...[
              6.width,
              Icon(Icons.add, size: 16.sp, color: Colors.grey.shade700),
            ],
          ],
        ),
      ),
    );
  }
}
