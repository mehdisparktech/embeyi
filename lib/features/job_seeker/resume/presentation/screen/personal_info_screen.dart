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
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();
  final TextEditingController portfolioController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    linkedinController.dispose();
    portfolioController.dispose();
    nationalityController.dispose();
    dobController.dispose();
    genderController.dispose();
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

                      _buildLabel('Phone Number'),
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

                      _buildLabel('LinkedIn Profile'),
                      8.height,
                      CommonTextField(
                        controller: linkedinController,
                        hintText: 'Enter your LinkedIn URL',
                        keyboardType: TextInputType.url,
                      ),
                      16.height,

                      _buildLabel('Portfolio URL'),
                      8.height,
                      CommonTextField(
                        controller: portfolioController,
                        hintText: 'Enter your portfolio URL',
                        keyboardType: TextInputType.url,
                      ),
                      16.height,

                      _buildLabel('Nationality'),
                      8.height,
                      CommonTextField(
                        controller: nationalityController,
                        hintText: 'Enter your nationality',
                      ),
                      16.height,

                      _buildLabel('Date of Birth'),
                      8.height,
                      CommonTextField(
                        controller: dobController,
                        hintText: 'Select date',
                        readOnly: true,
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          size: 20.sp,
                          color: AppColors.primary,
                        ),
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            dobController.text =
                                '${date.day}/${date.month}/${date.year}';
                          }
                        },
                      ),
                      16.height,

                      _buildLabel('Gender'),
                      8.height,
                      CommonTextField(
                        controller: genderController,
                        hintText: 'Select gender',
                        readOnly: true,
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          size: 24.sp,
                          color: AppColors.primary,
                        ),
                        onTap: () {
                          _showGenderBottomSheet(context);
                        },
                      ),
                      24.height,
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

  void _showGenderBottomSheet(BuildContext context) {
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
                title: const CommonText(text: 'Male', fontSize: 16),
                onTap: () {
                  genderController.text = 'Male';
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const CommonText(text: 'Female', fontSize: 16),
                onTap: () {
                  genderController.text = 'Female';
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const CommonText(text: 'Other', fontSize: 16),
                onTap: () {
                  genderController.text = 'Other';
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
