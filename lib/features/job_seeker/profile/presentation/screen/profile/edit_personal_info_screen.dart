import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/button/common_button.dart';
import '../../widgets/profile_section.dart';
import '../../widgets/form_field_with_label.dart';

class EditPersonalInfoScreen extends StatefulWidget {
  const EditPersonalInfoScreen({super.key});

  @override
  State<EditPersonalInfoScreen> createState() => _EditPersonalInfoScreenState();
}

class _EditPersonalInfoScreenState extends State<EditPersonalInfoScreen> {
  final TextEditingController _fullNameController = TextEditingController(
    text: 'Shakir Ahmed',
  );
  final TextEditingController _designationController = TextEditingController(
    text: 'UI/UX Designer',
  );
  final TextEditingController _dateOfBirthController = TextEditingController(
    text: '01 January 2000',
  );
  final TextEditingController _genderController = TextEditingController(
    text: 'Male',
  );
  final TextEditingController _nationalityController = TextEditingController(
    text: 'American',
  );
  final TextEditingController _addressController = TextEditingController(
    text: '2471 Derby Ave, Strubens Valley, Gauteng',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '+123456789',
  );
  final TextEditingController _socialMediaController = TextEditingController(
    text: 'Linkedin.com/Profile',
  );
  final TextEditingController _summaryController = TextEditingController(
    text:
        'Creative And Detail-Oriented UI/UX Designer With Expertise In Crafting Intuitive Mobile And Web Experiences. Skilled In Wireframing, Prototyping, And Design Systems',
  );

  @override
  void dispose() {
    _fullNameController.dispose();
    _designationController.dispose();
    _dateOfBirthController.dispose();
    _genderController.dispose();
    _nationalityController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _socialMediaController.dispose();
    _summaryController.dispose();
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
          text: 'Personal Information',
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
          color: AppColors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              _buildProfileSection(),
              SizedBox(height: 32.h),
              _buildFormFields(),
              SizedBox(height: 40.h),
              _buildUpdateButton(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return ProfileSection(
      name: 'Shakir Ahmed',
      designation: 'UI/UX Designer',
      imagePath: 'assets/images/profile.png',
      showEditIcon: true,
      onEditTap: () {
        // Handle profile image edit
      },
    );
  }

  Widget _buildFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormFieldWithLabel(label: 'Full Name', controller: _fullNameController),
        SizedBox(height: 20.h),
        FormFieldWithLabel(
          label: 'Designation',
          controller: _designationController,
        ),
        SizedBox(height: 20.h),
        FormFieldWithLabel(
          label: 'Date Of Birth',
          controller: _dateOfBirthController,
          suffixIcon: Icons.calendar_today,
          readOnly: true,
          onTap: () {
            // Handle date picker
          },
        ),
        SizedBox(height: 20.h),
        FormFieldWithLabel(
          label: 'Gender',
          controller: _genderController,
          suffixIcon: Icons.keyboard_arrow_down,
          readOnly: true,
          onTap: () {
            // Handle gender selection
          },
        ),
        SizedBox(height: 20.h),
        FormFieldWithLabel(
          label: 'Nationality',
          controller: _nationalityController,
        ),
        SizedBox(height: 20.h),
        FormFieldWithLabel(label: 'Address', controller: _addressController),
        SizedBox(height: 20.h),
        FormFieldWithLabel(
          label: 'Phone',
          controller: _phoneController,
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: 20.h),
        FormFieldWithLabel(
          label: 'Social Media Link',
          controller: _socialMediaController,
          keyboardType: TextInputType.url,
        ),
        SizedBox(height: 20.h),
        FormFieldWithLabel(
          label: 'Summary',
          controller: _summaryController,
          maxLines: 4,
          textInputAction: TextInputAction.newline,
        ),
      ],
    );
  }

  Widget _buildUpdateButton() {
    return CommonButton(
      titleText: 'Update',
      titleSize: 16.sp,
      titleWeight: FontWeight.w600,
      buttonHeight: 52.h,
      buttonRadius: 8.r,
      onTap: () {
        // Handle update logic
        Navigator.pop(context);
      },
    );
  }
}
