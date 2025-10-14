import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/utils/extensions/extension.dart';
import 'personal_info_screen.dart';
import 'core_skills_screen.dart';
import 'work_experience_screen.dart';
import 'project_screen.dart';
import 'education_screen.dart';
import 'certification_screen.dart';

class EditResumeScreen extends StatelessWidget {
  const EditResumeScreen({super.key});

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
          text: 'Edit Resume',
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Edit Resume Button
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.edit_document,
                        color: AppColors.primary,
                        size: 32.sp,
                      ),
                      8.height,
                      const CommonText(
                        text: 'Edit Resume',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
                24.height,

                /// Resume Section Title
                const CommonText(
                  text: 'Resume Section',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                16.height,

                /// Section List
                _buildSectionItem(
                  context,
                  icon: Icons.person,
                  iconColor: Colors.orange,
                  iconBgColor: Colors.orange.shade50,
                  title: 'Personal Info',
                  subtitle: 'Complete',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PersonalInfoScreen(),
                      ),
                    );
                  },
                ),
                12.height,

                _buildSectionItem(
                  context,
                  icon: Icons.workspace_premium,
                  iconColor: Colors.blue,
                  iconBgColor: Colors.blue.shade50,
                  title: 'Core Skills',
                  subtitle: 'Complete',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CoreSkillsScreen(),
                      ),
                    );
                  },
                ),
                12.height,

                _buildSectionItem(
                  context,
                  icon: Icons.work_history,
                  iconColor: Colors.purple,
                  iconBgColor: Colors.purple.shade50,
                  title: 'Work Experience',
                  subtitle: 'Complete',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WorkExperienceScreen(),
                      ),
                    );
                  },
                ),
                12.height,

                _buildSectionItem(
                  context,
                  icon: Icons.work,
                  iconColor: Colors.teal,
                  iconBgColor: Colors.teal.shade50,
                  title: 'Project',
                  subtitle: 'Complete',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProjectScreen(),
                      ),
                    );
                  },
                ),
                12.height,

                _buildSectionItem(
                  context,
                  icon: Icons.school,
                  iconColor: Colors.blue,
                  iconBgColor: Colors.blue.shade50,
                  title: 'Education',
                  subtitle: 'Complete',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EducationScreen(),
                      ),
                    );
                  },
                ),
                12.height,

                _buildSectionItem(
                  context,
                  icon: Icons.card_membership,
                  iconColor: Colors.green,
                  iconBgColor: Colors.green.shade50,
                  title: 'Certification',
                  subtitle: 'Complete',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CertificationScreen(),
                      ),
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

  Widget _buildSectionItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Row(
          children: [
            /// Icon
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(icon, color: iconColor, size: 24.sp),
            ),
            16.width,

            /// Title and Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: title,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  4.height,
                  CommonText(
                    text: subtitle,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),

            /// Arrow Icon
            Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 24.sp),
          ],
        ),
      ),
    );
  }
}
