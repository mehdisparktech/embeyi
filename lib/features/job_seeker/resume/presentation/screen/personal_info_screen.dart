import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/text_field/common_text_field.dart';
import '../../../../../../core/utils/extensions/extension.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final TextEditingController resumeNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();
  final TextEditingController portfolioController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController socialMediaController = TextEditingController();
  final TextEditingController githubController = TextEditingController();
  final TextEditingController workAuthorizationController =
      TextEditingController();
  final TextEditingController clearancesController = TextEditingController();
  final TextEditingController openToWorkStatusController =
      TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  @override
  void dispose() {
    resumeNameController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    linkedinController.dispose();
    portfolioController.dispose();
    nationalityController.dispose();
    dobController.dispose();
    genderController.dispose();
    socialMediaController.dispose();
    githubController.dispose();
    workAuthorizationController.dispose();
    clearancesController.dispose();
    openToWorkStatusController.dispose();
    summaryController.dispose();
    super.dispose();
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
          text: 'Personal Information',
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
                      _buildLabel('Resume Name'),
                      8.height,
                      CommonTextField(
                        controller: resumeNameController,
                        hintText: 'Enter your resume name',
                        keyboardType: TextInputType.name,
                      ),
                      16.height,
                      _buildLabel('Full Name'),
                      8.height,
                      CommonTextField(
                        controller: fullNameController,
                        hintText: 'Enter your full name',
                        keyboardType: TextInputType.name,
                      ),
                      16.height,

                      _buildLabel('Email'),
                      8.height,
                      CommonTextField(
                        controller: emailController,
                        hintText: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      16.height,

                      _buildLabel('Mobile Number'),
                      8.height,
                      CommonTextField(
                        controller: phoneController,
                        hintText: 'Enter your phone number',
                        keyboardType: TextInputType.phone,
                      ),
                      16.height,

                      _buildLabel('Address'),
                      8.height,
                      CommonTextField(
                        controller: addressController,
                        hintText: 'Enter your address',
                        maxLines: 3,
                      ),
                      16.height,
                      _buildLabel('Social Media Link'),
                      8.height,
                      CommonTextField(
                        controller: socialMediaController,
                        hintText: 'Enter your social media link',
                        keyboardType: TextInputType.url,
                      ),
                      16.height,
                      _buildLabel('Github Link'),
                      8.height,
                      CommonTextField(
                        controller: githubController,
                        hintText: 'Enter your Github URL',
                        keyboardType: TextInputType.url,
                      ),
                      16.height,

                      _buildLabel('Work Authorization'),
                      8.height,
                      CommonTextField(
                        controller: workAuthorizationController,
                        hintText: 'Enter your work authorization',
                      ),
                      16.height,

                      _buildLabel('Clearances'),
                      8.height,
                      CommonTextField(
                        controller: clearancesController,
                        hintText: 'Enter your clearances',
                      ),
                      16.height,

                      // _buildLabel('Date of Birth'),
                      // 8.height,
                      // CommonTextField(
                      //   controller: dobController,
                      //   hintText: 'Select date',
                      //   readOnly: true,
                      //   suffixIcon: Icon(
                      //     Icons.calendar_today,
                      //     size: 20.sp,
                      //     color: AppColors.primary,
                      //   ),
                      //   onTap: () async {
                      //     final date = await showDatePicker(
                      //       context: context,
                      //       initialDate: DateTime.now(),
                      //       firstDate: DateTime(1950),
                      //       lastDate: DateTime.now(),
                      //     );
                      //     if (date != null) {
                      //       dobController.text =
                      //           '${date.day}/${date.month}/${date.year}';
                      //     }
                      //   },
                      // ),
                      16.height,

                      _buildLabel('Open to Work'),
                      8.height,
                      CommonTextField(
                        controller: openToWorkStatusController,
                        hintText: 'Select open to work',
                        readOnly: true,
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          size: 24.sp,
                          color: AppColors.primary,
                        ),
                        onTap: () {
                          _showOpenToWorkBottomSheet(context);
                        },
                      ),
                      16.height,
                      _buildLabel('Summary'),
                      8.height,
                      CommonTextField(
                        controller: summaryController,
                        hintText: 'Enter your summary',
                        maxLines: 4,
                      ),
                      16.height,
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
                    // Handle update
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
                    text: 'Update',
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
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  void _showOpenToWorkBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const CommonText(text: 'Remote', fontSize: 16),
                onTap: () {
                  openToWorkStatusController.text = 'Remote';
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const CommonText(text: 'Onsite', fontSize: 16),
                onTap: () {
                  openToWorkStatusController.text = 'Onsite';
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const CommonText(text: 'Hybrid', fontSize: 16),
                onTap: () {
                  openToWorkStatusController.text = 'Hybrid';
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
